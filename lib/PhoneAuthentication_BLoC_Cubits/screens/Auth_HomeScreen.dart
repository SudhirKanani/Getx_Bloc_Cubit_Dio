
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/PhoneAuthentication_BLoC_Cubits/cubits/auth_cubit.dart';
import 'package:getx_test/PhoneAuthentication_BLoC_Cubits/cubits/auth_state.dart';
import 'package:getx_test/PhoneAuthentication_BLoC_Cubits/screens/SigninScreen.dart';

class Auth_HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sing In",style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue),
      body: BlocConsumer<AuthCubit,AuthState>(
        builder: (context, state) {
          return Center(
              child: CupertinoButton(child: Text("Logout"),onPressed: (){
          BlocProvider.of<AuthCubit>(context).logOut();
          }));
        },
        listener: (context, state) {
          if(state is AuthCodeLoggedOutState)
            {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => SignInScreen()));
            }
        },
      ),
    );
  }
}