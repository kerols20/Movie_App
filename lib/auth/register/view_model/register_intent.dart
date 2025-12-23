sealed class RegisterIntent {}
class CallRegisterIntent extends RegisterIntent{
  final String emailAddress;
  final String password;
  CallRegisterIntent(this.emailAddress, this.password);
}
class ButtonIsDisabled extends RegisterIntent {}


