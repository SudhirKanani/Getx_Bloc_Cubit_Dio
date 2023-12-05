import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/signIn/bloc/SignInEvent.dart';
import 'package:getx_test/signIn/bloc/SignInState.dart';
import 'package:getx_test/signIn/bloc/SingInBloc.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingInBloc(),
      child: MaterialApp(
        title: "SignIn",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SignInPage(),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  var emailController = new TextEditingController();
  var passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
        backgroundColor: CupertinoColors.lightBackgroundGray,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            BlocBuilder<SingInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMsg,
                    style: TextStyle(color: Colors.red),
                  );
                }

                return Text(
                  "",
                  style: TextStyle(color: Colors.red),
                );
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "enter email",
              ),
              onChanged: (value) {
                BlocProvider.of<SingInBloc>(context).add(SingInTextChangeEvent(
                    emailController.text, passController.text));
              },
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                hintText: "enter password",
              ),
              onChanged: (value) {
                BlocProvider.of<SingInBloc>(context).add(SingInTextChangeEvent(
                    emailController.text, passController.text));
              },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder<SingInBloc, SignInState>(
                  builder: (context, state) {
                if (state is SignInLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                return CupertinoButton(
                  child: Text("Sign In"),
                  onPressed: () {
                    if (state is SignInvalidState) {
                      BlocProvider.of<SingInBloc>(context).add(
                          SignInSubmitedEvent(
                              emailController.text, passController.text));
                    }
                  },
                  color:
                      (state is SignInvalidState) ? Colors.blue : Colors.grey,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
