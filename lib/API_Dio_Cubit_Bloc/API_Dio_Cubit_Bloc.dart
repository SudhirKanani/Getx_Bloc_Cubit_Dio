

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_test/API_Dio_Cubit_Bloc/Screen/HomeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/API_Dio_Cubit_Bloc/bloc/PostCubit.dart';

class API_Dio_Cubit_Bloc extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dio Api",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => PostCubit(),
          child: HomeScreen()),
    );
  }
}

