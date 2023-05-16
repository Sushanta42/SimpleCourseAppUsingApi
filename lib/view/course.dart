import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeit/controller/coursecontroller.dart';
import 'package:codeit/util/size.dart';
import 'package:codeit/view/syllabus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CourseView extends StatelessWidget {
  const CourseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var courseController = Get.find<CourseController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Course List"),
        ),
        body: Obx(() {
          if (courseController.isLoading.value == true) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Lottie.asset("images/searching.json"),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            courseController.coursetypebyid.value.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          var course =
                              courseController.coursetypebyid.value.data[index];
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppLayOut.screenWidth,
                                  height: 200,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: "${course.featured}",
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                ListTile(
                                  title: Text("${course.courseName}"),
                                  subtitle: Row(
                                    children: [
                                      const Icon(Icons.timer),
                                      Text("${course.duration}"),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(Icons.category),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text("${course.category}"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            courseController.getSyllabusDetail(course.id);
                                            Get.to(() => const SyllabusView());
                                          },
                                          child: const Text("Read Syllabus"))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
