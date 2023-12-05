import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/Generated_Routes/cubits/FirstCubit.dart';

import '../cubits/SecoundCubit.dart';

class SecoundScreen extends StatelessWidget {
  final String title;
  const SecoundScreen({Key? key,required this.title}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(this.title),
          actions: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context, "/third");
            }, icon: Icon(Icons.arrow_forward))
          ],
          backgroundColor: Colors.blue),
      body: SafeArea(child: Center(
        child: BlocBuilder<SecoundCubit, int>(
          builder: (context, state) {
            return Text(state.toString(),
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold));
          },
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<SecoundCubit>(context).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }

}
