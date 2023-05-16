import 'package:codeit/model/course.dart';
import 'package:codeit/model/coursetype.dart';
import 'package:codeit/model/popular.dart';
import 'package:codeit/model/syllabus.dart';
import 'package:codeit/model/upcoming.dart';
import 'package:get/get.dart';

import '../service/course.dart';

class CourseController extends GetxController {
  var upcoming = UpcomingModel(data: []).obs;
  var isLoading = false.obs;
  var popular = PopularCourseModel(data: []).obs;
  var coursetype = CourseTypeModel(data: []).obs;
  var coursetypebyid = CourseModel(data: []).obs;
  var syllabus = SyllabusModel(data: null).obs;

  //Get upcoming course
  Future getUpcomingCoursedata() async {
    try {
      isLoading(true);
      var response = await CourseService.getUpcomingCourse();
      if (response != null) {
        upcoming.value = response;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Get Popular course
  Future getPopularCourseController() async {
    try {
      isLoading(true);
      var response = await CourseService.getPopularCourse();
      if (response != null) {
        popular.value = response;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Course Type
  Future getCourseTypeController() async {
    try {
      isLoading(true);
      var response = await CourseService.getCourseType();
      if (response != null) {
        coursetype.value = response;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future getCourse(var id) async {
    try {
      isLoading(true);
      var response = await CourseService.getCourseTypeById(id);
      if (response != null) {
        coursetypebyid.value = response;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Get syllabus detail
  Future getSyllabusDetail(var id) async {
    try {
      isLoading(true);
      var response = await CourseService.getCourseSyllabus(id);
      if (response != null) {
        syllabus.value = response;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUpcomingCoursedata();
    getPopularCourseController();
    getCourseTypeController();
  }
}
