import 'package:get/get.dart';
import 'package:getx_test/student.dart';


class MyController extends GetxController {

  var student = Student("sk").obs;

  void updateCount(){
   student.update((val) {
     student.value.name = student.value.name.toString().toUpperCase();
   });

  }
}