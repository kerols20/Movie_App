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
  Future<UserCredential?> _signInWithEmailAndPassword(String email, String password) async {UserCredential? credential;
  try {
    emit(LoginLoading());
    credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    emit(LoginSuccess(credential.user!.uid));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      emit(LoginFailure(e.message!));
      print('Wrong password provided for that user.');
    }
  }
  return credential;
  }
}
