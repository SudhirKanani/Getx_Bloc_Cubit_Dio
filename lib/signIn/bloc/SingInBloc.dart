import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/signIn/bloc/SignInEvent.dart';
import 'package:getx_test/signIn/bloc/SignInState.dart';

class SingInBloc extends Bloc<SignInEvent, SignInState> {
  SingInBloc() : super(SignInInitState()) {
    on<SingInTextChangeEvent>((event, emit) {
      if (!EmailValidator.validate(event.emailValue)) {
        emit(SignInErrorState("Please enter valid email"));
      } else if (event.passValue.length < 8) {
        emit(SignInErrorState("Please enter valid password"));
      } else {
        emit(SignInvalidState());
      }
    });
    on<SignInSubmitedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
