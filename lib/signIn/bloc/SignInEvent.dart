abstract class SignInEvent{}

class SingInTextChangeEvent extends SignInEvent{
  String emailValue;
  String passValue;
  SingInTextChangeEvent(this.emailValue,this.passValue);
}

class SignInSubmitedEvent extends SignInEvent{
  String email;
  String pass;
  SignInSubmitedEvent(this.email,this.pass);
}