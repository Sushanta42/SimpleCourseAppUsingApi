import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeit/controller/coursecontroller.dart';
import 'package:codeit/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

class SyllabusView extends StatelessWidget {
  const SyllabusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var coursesyllabus = Get.find<CourseController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          if (coursesyllabus.isLoading.value == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          "${coursesyllabus.syllabus.value.data!.featured}",
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    title: Text(
                        "${coursesyllabus.syllabus.value.data!.courseName}"),
                    subtitle: Row(
                      children: [
                        const Icon(Icons.timer),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("${coursesyllabus.syllabus.value.data!.duration}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppLayOut.hs),
                    child: HtmlWidget(
                        "${coursesyllabus.syllabus.value.data!.syllabus}"),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
