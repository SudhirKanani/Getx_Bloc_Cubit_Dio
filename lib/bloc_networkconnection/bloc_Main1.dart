import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/cubits/internet_cubits.dart';

class bloc_Main1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => InternetCubit(),
        child: MaterialApp(
          title: "Block 1",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: home(),
        ));
  }
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            builder: (BuildContext context, InternetState state) {
              if (state == InternetState.Gained) {
                return Text("Connected");
              } else if (state == InternetState.Lost) {
                return Text("Not Connected");
              } else {
                return Text("Loading...");
              }
            },
            listener: (BuildContext context, InternetState state) {
              if (state == InternetState.Gained) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Connected"),
                  backgroundColor: Colors.green)
                );
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Not Connected"),
                  backgroundColor: Colors.red)
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Loading"))
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
