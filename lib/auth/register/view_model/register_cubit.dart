import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/auth/register/view_model/register_intent.dart';
import 'package:movie_app/auth/register/view_model/register_state.dart';
import 'package:movie_app/core/exception/response_exception.dart';
import '../../../core/sate_status/sate_status.dart';
class RegisterCubit extends Cubit<RegisterState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  RegisterCubit() : super(RegisterState()) {
    confirmPasswordController.addListener(_checkButtonStatus);
    nameController.addListener(_checkButtonStatus);
    emailController.addListener(_checkButtonStatus);
    passwordController.addListener(_checkButtonStatus);
  }

  void doIntent(RegisterIntent intent) {
    switch (intent) {
      case CallRegisterIntent():
        _register(
          intent.emailAddress,
          intent.password,
        );
      case ButtonIsDisabled():
        _checkButtonStatus();
        break;
    }
  }

  void _checkButtonStatus() {
    final isValid =
        nameController.text.isNotEmpty &&
            emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty &&
            confirmPasswordController.text.isNotEmpty &&
            confirmPasswordController.text == passwordController.text;

    emit(state.copyWith(isButtonDisabled: isValid));
  }

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  void confirmPasswordVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    emit(state.copyWith(registerStatus: StateStatus.initial()));
  }
  void resetRegisterState() {
    emit(state.copyWith(registerStatus: const StateStatus.initial()));
  }
  void passwordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(state.copyWith(registerStatus: StateStatus.initial()));
  }

  Future<UserCredential?> _register(emailAddress, password) async {
    UserCredential? credential;
    try {
      emit(state.copyWith(registerStatus: StateStatus.loading()));

      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      emit(state.copyWith(registerStatus: StateStatus.success(
        credential,
      )));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(registerStatus: StateStatus.failure(
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
