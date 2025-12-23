import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/exception/response_exception.dart';
import '../../../core/sate_status/sate_status.dart';
import 'login_intent.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginCubit() : super(LoginState()) {
    emailController.addListener(_checkButtonStatus);
    passwordController.addListener(_checkButtonStatus);
  }

  void doIntent(LoginIntent intent) {
    switch (intent) {
      case LoginFirebase():
        _signInWithEmailAndPassword(intent.email, intent.password,);
        break;
    }
  }
  void resetLoginState() {
    emit(state.copyWith(loginState: const StateStatus.initial()));
  }

  void _checkButtonStatus() {
    final isValid = emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
    emit(state.copyWith(isButtonDisabled: isValid));
  }
  bool isPasswordHidden = true;
  void passwordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(state.copyWith(loginState: StateStatus.initial()));
  }

  Future<UserCredential?> _signInWithEmailAndPassword(String email, String password) async {
    UserCredential? credential;
    try {
      emit(state.copyWith(loginState: StateStatus.loading()));

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(state.copyWith(loginState: StateStatus.success(credential)));



    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(loginState: StateStatus.failure(
        ResponseException(message: e.message ?? "An error occurred"),
      ),
      ));
    }
    return credential;
  }
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}