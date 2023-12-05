import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/PhoneAuthentication_BLoC_Cubits/cubits/auth_cubit.dart';
import 'package:getx_test/PhoneAuthentication_BLoC_Cubits/cubits/auth_state.dart';

import 'VerifyScreen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  var phoneCotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Sing In", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: phoneCotroller,
              decoration: InputDecoration(
                hintText: "enter phone number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }

                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoButton(
                    child: Text("Send Otp"),
                    onPressed: () {
                      String phoneNumber = "+91" + phoneCotroller.text;
                      BlocProvider.of<AuthCubit>(context).sendOTP(phoneNumber);
                    },
                    color: Colors.blue,
                  ),
                );
              },
              listener: (context, state) {
                if (state is AuthCodeSendState) {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => VerifyScreen()));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
