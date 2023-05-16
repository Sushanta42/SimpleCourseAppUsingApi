import 'package:codeit/controller/coursecontroller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CourseController());
  }
}
