abstract class AuthState{}

class AuthInitState extends AuthState{}

class AuthLoadingState extends AuthState{}

class AuthCodeSendState extends AuthState{}

class AuthCodeVerifiedState extends AuthState{}

class AuthCodeLoggedInState extends AuthState{}

class AuthCodeLoggedOutState extends AuthState{}

class AuthErrorState extends AuthState{
  final String error;
  AuthErrorState(this.error);
}
