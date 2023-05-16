import 'dart:convert';

import 'package:codeit/model/coursetype.dart';
import 'package:codeit/model/popular.dart';
import 'package:codeit/model/syllabus.dart';
import 'package:codeit/model/upcoming.dart';
import 'package:codeit/util/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/course.dart';

class CourseService {
  //Upcoming Courses
  static Future getUpcomingCourse() async {
    try {
      var response = await Api.client.get(
          Uri.parse("${Api.baseUrl}/upcoming-classes"),
          headers: Api.headers);
      if (response.statusCode == 200) {
        var jsonString = json.decode(response.body);
        return UpcomingModel.fromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //Popular course
  static Future getPopularCourse() async {
    try {
      var response = await Api.client.get(
          Uri.parse("${Api.baseUrl}/popular-course"),
          headers: Api.headers);
      if (response.statusCode == 200) {
        var jsonString = json.decode(response.body);
        return PopularCourseModel.fromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //Course Type
  static Future getCourseType() async {
    try {
      var response = await Api.client
          .get(Uri.parse("${Api.baseUrl}/course-type"), headers: Api.headers);
      if (response.statusCode == 200) {
        var jsonString = json.decode(response.body);
        return CourseTypeModel.fromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Search Course Type
  static Future getCourseTypeById(var id) async {
    try {
      var response = await Api.client.get(
          Uri.parse("${Api.baseUrl}/course-type/$id"),
          headers: Api.headers);
      if (response.statusCode == 200) {
        var jsonString = json.decode(response.body);
        return CourseModel.fromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Get Course Syllabus

  static Future getCourseSyllabus(var id) async {
    try {
      var response = await Api.client
          .get(Uri.parse("${Api.baseUrl}/course/$id"), headers: Api.headers);
      if (response.statusCode == 200) {
        var jsonString = json.decode(response.body);
        return SyllabusModel.fromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error $e");
    }
  }
}
