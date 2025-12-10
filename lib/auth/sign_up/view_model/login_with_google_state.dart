import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/sate_status/sate_status.dart';
class LoginWithGoogleState {
  final StateStatus<UserCredential> loginStatus;

  const LoginWithGoogleState({
    this.loginStatus = const StateStatus.initial(),
  });

  LoginWithGoogleState copyWith({
    StateStatus<UserCredential>? loginStatus,
  }) {
    return LoginWithGoogleState(
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
}
