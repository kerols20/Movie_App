import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_intent.dart';
import 'login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  final GlobalKey formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginCubit() : super(LoginInitial());
  void doIntent(LoginIntent intent) {
    switch (intent){
      case LoginFirebase():
        _signInWithEmailAndPassword(
          intent.email,
          intent.password,
        );
        break;
    }
  }
  bool isPasswordHidden = true;
  void passwordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(PasswordVisibilityChanged());
  }
  Future<UserCredential?> _signInWithEmailAndPassword(String email, String password) async {
    UserCredential? credential;
    try {
      emit(LoginLoading());

      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccess(credential.user!.uid));
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format.';
          break;
        default:
          errorMessage = e.message ?? 'An unknown error occurred.';
      }

      emit(LoginFailure(errorMessage));
    } catch (e) {
      emit(LoginFailure('Something went wrong. Please try again.'));
    }

    return credential;
  }

}
