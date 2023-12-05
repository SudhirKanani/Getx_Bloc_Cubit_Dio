import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/MyController.dart';
import 'package:getx_test/student.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("homescreen"),
        backgroundColor:Colors.deepPurple.shade200,
      ),
      body: _MyHomePageState(),
    );
  }
}


class _MyHomePageState extends StatelessWidget {
  var count = 0.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => Text("My Name us ${Get.find<MyController>().student.value.name}",style: TextStyle(fontSize: 25),)),
            Padding(padding: EdgeInsets.only(top: 15),
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
