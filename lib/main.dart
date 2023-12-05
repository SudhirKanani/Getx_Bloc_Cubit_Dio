
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/API_Dio_Cubit_Bloc/model/PostModel.dart';
import 'package:getx_test/API_Dio_Cubit_Bloc/repo/PostRepo.dart';
import 'package:getx_test/MyAppControllerBinding.dart';
import 'package:getx_test/MyController.dart';
import 'package:getx_test/firebase_options.dart';
import 'package:getx_test/main2.dart';
import 'package:getx_test/signIn/SignIn.dart';

import 'API_Dio_Cubit_Bloc/API_Dio_Cubit_Bloc.dart';
import 'AllControllerBinding.dart';
import 'Generated_Routes/Generated_Routes_Main.dart';
import 'MyControllerBinding.dart';
import 'PhoneAuthentication_BLoC_Cubits/main.dart';
import 'package:firebase_core/firebase_core.dart';

 main()  {
  WidgetsFlutterBinding.ensureInitialized();

  // PostRepo postRepo = PostRepo();
  // List<PostModel> postModel =  await  postRepo.fetchPost();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(API_Dio_Cubit_Bloc());
}

void main11()  async{

  // MyAppControllerBinding().dependencies();
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();

  runApp(main1());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: AllControllerBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: homescreen1(),
      initialRoute: '/home',
      getPages: appRoutes(),
    );
  }
}

class homescreen1 extends StatelessWidget {
  homescreen1({super.key});

  var count = 0.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => Text(
                  "My Name us ${Get.find<MyController>().student.value.name}",
                  style: TextStyle(fontSize: 25),
                )),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: ElevatedButton(
                  onPressed: () {
                    // increment();
                    Get.find<MyController>().updateCount();
                  },
                  child: const Text("Update Name")),
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/home2",
                      arguments: {'status': 'Home Page Success!!'});

                  //Snackbar

                  /*Get.snackbar(
                'GetX Snackbar',
                'Yay! Awesome GetX Snackbar',
                 snackPosition: SnackPosition.BOTTOM,
                icon: const Icon(Icons.access_alarm));*/

                  //Dialog
/*
                  Get.defaultDialog(
                      title: "Hello",
                      middleText: "are you sure to delete",
                      textConfirm: "Okay",
                  textCancel: "cancel",
                  );
*/

                  //bottomSheet dialog
/*
                  Get.bottomSheet(
                      Wrap(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.wb_sunny_outlined),
                            title: const Text("Light Theme"),
                            onTap: () {
                              Get.changeTheme(ThemeData.light());
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.sunny),
                            title: const Text("Dark Theme"),
                            onTap: () {
                              Get.changeTheme(ThemeData.dark());
                            },
                          )
                        ],
                      ),
                      backgroundColor: Colors.white,
                      isDismissible: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          side: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 2.0)));
*/
                },
                child: const Text("Click to show"))
          ],
        ),
      ),
    );
  }
}

appRoutes() => [
      GetPage(
          name: "/home",
          // page: () => MyHomePage(title: 'Flutter Demo Home Page'),
          page: () => homescreen(),
          transition: Transition.leftToRight,
          transitionDuration: Duration(milliseconds: 500),
          binding: MyControllerBinding()),
      GetPage(
          name: "/home2",
          page: () => homescreen(),
          transition: Transition.rightToLeft,
          transitionDuration: Duration(milliseconds: 500))
    ];
