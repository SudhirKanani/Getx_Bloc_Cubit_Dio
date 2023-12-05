import 'package:flutter/material.dart';

import 'Routes.dart';

class Generated_Routes_Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated Routes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: "/first",
    );
  }
}
