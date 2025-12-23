import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/sate_status/sate_status.dart';

final class RegisterState {
  final bool isButtonDisabled;
  final StateStatus<UserCredential> registerStatus;
  const RegisterState({
    this.isButtonDisabled = false,
    this.registerStatus = const StateStatus.initial(),
  });
  RegisterState copyWith({
    bool? isButtonDisabled,
    StateStatus<UserCredential>? registerStatus,
  }) {
    return RegisterState(
      isButtonDisabled: isButtonDisabled ?? this.isButtonDisabled,
      registerStatus: registerStatus ?? this.registerStatus,
    );
  }
}