import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/Generated_Routes/cubits/FirstCubit.dart';

import '../cubits/SecoundCubit.dart';
import '../cubits/ThirdCubit.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Third Screen"),
          actions: [
            IconButton(onPressed: () {
              
            }, icon: Icon(Icons.arrow_forward))
          ],
          backgroundColor: Colors.blue),
      body: SafeArea(child: Center(
        child: BlocBuilder<ThirdCubit, int>(
          builder: (context, state) {
            return Text(state.toString(),
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold));
          },
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ThirdCubit>(context).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
