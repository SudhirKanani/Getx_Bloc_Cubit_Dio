import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/Generated_Routes/Screen/SecoundScreen.dart';
import 'package:getx_test/Generated_Routes/cubits/FirstCubit.dart';
import 'package:getx_test/Generated_Routes/cubits/SecoundCubit.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("First Screen"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/second",arguments: {
                    "title":"dymanic title"
                  });
        /*          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                            create: (context) => SecoundCubit(),
                            child: SecoundScreen()),
                      ));*/
                },
                icon: Icon(Icons.arrow_forward))
          ],
          backgroundColor: Colors.blue),
      body: SafeArea(child: Center(
        child: BlocBuilder<FirstCubit, int>(
          builder: (context, state) {
            return Text(state.toString(),
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold));
          },
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<FirstCubit>(context).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
