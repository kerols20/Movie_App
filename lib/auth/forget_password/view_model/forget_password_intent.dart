sealed class ForgetPasswordIntent {}
class ForgetPasswordReset extends ForgetPasswordIntent  {
  final String emailAddress;
  ForgetPasswordReset(this.emailAddress);
}
