import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/exception/response_exception.dart';
import '../../../core/sate_status/sate_status.dart';
import 'forget_password_intent.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  ForgetPasswordCubit() : super(const ForgetPasswordState()){
    emailController.addListener(_checkButtonStatus);
  }

  void doIntent(ForgetPasswordIntent intent) {
    switch (intent) {
      case ForgetPasswordReset():
        _resetPassword(intent.emailAddress);
        break;
    }
  }
  void _checkButtonStatus() {
    final isValid = emailController.text.isNotEmpty;

    emit(state.copyWith(isButtonDisabled: isValid));
  }

  Future<void> _resetPassword(String emailAddress) async {
    try {
      emit(state.copyWith(forgetPassword: StateStatus.loading()));

      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);

      emit(state.copyWith(
        forgetPassword: StateStatus.success(null),
      ));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
        forgetPassword: StateStatus.failure(ResponseException(message: e.message ?? "An error occurred")),
      ));
    } catch (e) {
      emit(state.copyWith(
        forgetPassword: StateStatus.failure(ResponseException(message: e.toString())),
      ));
    }
  }
  void dispose() {
    emailController.dispose();
  }
}

///The argument type 'Null' can't be assigned to the parameter type 'UserCredential'. (Documentation)
/// that happened because final StateStatus<UserCredential> forgetPassword; in state is expect return UserCredential
/// but here we not needed so edit final StateStatus<void> forgetPassword; in state   forgetPassword: StateStatus.success(null), to forgetPassword: StateStatus.success(null),
///