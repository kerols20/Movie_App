import '../../../core/sate_status/sate_status.dart';
final class ForgetPasswordState {
  final bool isButtonDisabled;
  final StateStatus<void> forgetPassword;
  const ForgetPasswordState({
    this.isButtonDisabled = false,
    this.forgetPassword = const StateStatus.initial(),
  });
  ForgetPasswordState copyWith({
    bool? isButtonDisabled,
    StateStatus<void>? forgetPassword,
  }) {
    return ForgetPasswordState(
      isButtonDisabled: isButtonDisabled ?? this.isButtonDisabled,
      forgetPassword: forgetPassword ?? this.forgetPassword,
    );
  }
}


