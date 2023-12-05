import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthCubit() : super(AuthInitState()) {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      emit(AuthCodeLoggedInState());
    } else {
      emit(AuthCodeLoggedOutState());
    }
  }

  String? _verificationId;

  void sendOTP(String phoneNumber) async {
    emit(AuthLoadingState());
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        emit(AuthCodeSendState());
      },
      verificationCompleted: (phoneAuthCredential) {
        signWithPhone(phoneAuthCredential);
      },
      verificationFailed: (error) {
        emit(AuthErrorState(error.message.toString()));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  void verifyOtp(String otp) async {
    emit(AuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);
    signWithPhone(credential);
  }

  void signWithPhone(PhoneAuthCredential phoneAuthCredential) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      emit(AuthCodeLoggedInState());
      if (userCredential != null) {
        emit(AuthLoadingState());
      }
    } on FirebaseAuthException catch (ex) {
      emit(AuthErrorState(ex.message.toString()));
    }
  }

  void logOut() async{
    await _auth.signOut();
    emit(AuthCodeLoggedOutState());
  }
}
