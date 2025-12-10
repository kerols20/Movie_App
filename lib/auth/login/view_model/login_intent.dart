sealed class LoginIntent{}
class LoginFirebase extends LoginIntent{
  String email;
  String password;
  LoginFirebase(this.email, this.password);
}