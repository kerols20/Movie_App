import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/sate_status/sate_status.dart';

final class LoginState {
  final bool isButtonDisabled;
  final StateStatus<UserCredential> loginState;
  const LoginState({this.loginState = const StateStatus.initial(),this.isButtonDisabled = false,});

  LoginState copyWith({
    bool? isButtonDisabled,
    StateStatus<UserCredential>? loginState,
  }) {
    return LoginState(
      isButtonDisabled: isButtonDisabled ?? this.isButtonDisabled,
      loginState: loginState ?? this.loginState,
    );
  }
}
