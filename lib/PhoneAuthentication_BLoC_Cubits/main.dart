import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/PhoneAuthentication_BLoC_Cubits/cubits/auth_cubit.dart';
import 'package:getx_test/PhoneAuthentication_BLoC_Cubits/cubits/auth_state.dart';
import 'package:getx_test/PhoneAuthentication_BLoC_Cubits/screens/Auth_HomeScreen.dart';
import 'package:getx_test/PhoneAuthentication_BLoC_Cubits/screens/SigninScreen.dart';

class main1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: MaterialApp(
            title: "SignIn",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (previous, current) {
                return previous is AuthInitState;
              },
              builder: (context, state) {
                if (state is AuthCodeLoggedInState) {
                  return Auth_HomeScreen();
                }
                return SignInScreen();
              },
            )));
  }
}
