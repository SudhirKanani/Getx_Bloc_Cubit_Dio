import 'package:get/get.dart';
import 'package:getx_test/MyController.dart';


class MyAppControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyController());
  }
}