import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/PhoneAuthentication_BLoC_Cubits/cubits/auth_cubit.dart';
import 'package:getx_test/PhoneAuthentication_BLoC_Cubits/cubits/auth_state.dart';
import 'package:getx_test/PhoneAuthentication_BLoC_Cubits/screens/Auth_HomeScreen.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});

  var otpCotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Verify OTP", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: otpCotroller,
              decoration: InputDecoration(
                hintText: "enter OTP",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthCodeLoggedInState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => Auth_HomeScreen()));
                } else if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error),
                  backgroundColor: Colors.red,
                  duration: Duration(microseconds: 5000),));
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoButton(
                    child: Text("Verify Otp"),
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context)
                          .verifyOtp(otpCotroller.text);
                    },
                    color: Colors.blue,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
