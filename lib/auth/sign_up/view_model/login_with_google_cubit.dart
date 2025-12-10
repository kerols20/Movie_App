import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/exception/response_exception.dart';
import '../../../core/sate_status/sate_status.dart';
import 'login_with_google_intent.dart';
import 'login_with_google_state.dart';

class LoginWithGoogle extends Cubit<LoginWithGoogleState> {
  LoginWithGoogle() : super(LoginWithGoogleState());

  Future<void> doIntent(LoginWithGoogleIntent intent) async {
    switch (intent) {
      case SignInWithGoogle():
        await _signInWithGoogle();
        break;
    }
  }
  Future<void> _signInWithGoogle() async {
    try {
      emit(state.copyWith(loginStatus: const StateStatus.loading()));
      final user = await GoogleSignIn().signIn();
      if (user == null) {
        emit(state.copyWith(
          loginStatus: const StateStatus.failure(
            ResponseException(message: 'Login failed'),
          ),
        ));
        return;
      }

      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
          credential);
      emit(state.copyWith(
        loginStatus: StateStatus.success(userCredential),
      ));
    } catch (e, s) {
      log("Google login error: $e");
      log(s.toString());
      emit(state.copyWith(
        loginStatus: StateStatus.failure(
          ResponseException(message: e.toString()),
        ),
      ));
    }
  }
}
