abstract class SignInState{}

class SignInInitState extends SignInState{}

class SignInvalidState extends SignInState{}

class SignInErrorState extends SignInState{
  var errorMsg;
  SignInErrorState(this.errorMsg);
}

class SignInLoadingState extends SignInState{}