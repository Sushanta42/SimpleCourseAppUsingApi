import 'package:codeit/controller/coursecontroller.dart';
import 'package:codeit/util/size.dart';
import 'package:codeit/view/course.dart';
import 'package:codeit/widget/listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/hero.dart';
import '../widget/popular.dart';
import '../widget/upcoming.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var upcomingController = Get.find<CourseController>();
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (upcomingController.isLoading.value == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const HeroWidget(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppLayOut.hs),
                    child: Column(
                      children: [
                        //Course Type
                        const ListTileWidget(
                          title: "Course Type",
                          subtitle: "Select Course You Want",
                        ),
                        SizedBox(
                          width: AppLayOut.screenWidth,
                          height: 40,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: upcomingController
                                  .coursetype.value.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                var type = upcomingController
                                    .coursetype.value.data[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: ActionChip(
                                    label: Text("${type.title}"),
                                    onPressed: () {
                                      upcomingController.getCourse(type.id);
                                      Get.to(() => const CourseView());
                                    },
                                  ),
                                );
                              }),
                        ),
                        //Upcoming Class
                        UpcomingWidget(upcomingController: upcomingController),

                        //Popular Course
                        PopularCourseWidget(
                            upcomingController: upcomingController)
                      ],
                    ),
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
