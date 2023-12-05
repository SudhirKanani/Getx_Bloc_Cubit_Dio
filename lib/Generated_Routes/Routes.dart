import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/Generated_Routes/Screen/FirstScreen.dart';
import 'package:getx_test/Generated_Routes/Screen/SecoundScreen.dart';
import 'package:getx_test/Generated_Routes/Screen/ThirdScreen.dart';
import 'package:getx_test/Generated_Routes/cubits/FirstCubit.dart';
import 'package:getx_test/Generated_Routes/cubits/SecoundCubit.dart';
import 'package:getx_test/Generated_Routes/cubits/ThirdCubit.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case "/first":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => FirstCubit(),
                  child: FirstScreen(),
                ));

      case "/second":
        Map<String,dynamic> map = settings.arguments as Map<String,dynamic>;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => SecoundCubit(),
              child: SecoundScreen(title: map["title"],),
            ));


      case "/third":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ThirdCubit(),
              child: ThirdScreen(),
            ));

      default :
    }
  }
}
