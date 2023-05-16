import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/coursecontroller.dart';
import '../view/syllabus.dart';
import 'listtile.dart';

class PopularCourseWidget extends StatelessWidget {
  const PopularCourseWidget({
    Key? key,
    required this.upcomingController,
  }) : super(key: key);

  final CourseController upcomingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTileWidget(
          title: "Popular Course",
          subtitle: "Join our top courses",
        ),
        GridView.builder(
            itemCount: upcomingController.popular.value.data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              var course = upcomingController.popular.value.data[index];
              return GestureDetector(
                onTap: () {
                  upcomingController.getSyllabusDetail(course.id);
                  Get.to(() => const SyllabusView());
                },
                child: Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      FittedBox(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: "${course.image}",
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            Text(
                              "${course.name}",
                              style: const TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.access_time_rounded),
                                Text(
                                  "${course.duration}",
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            })
      ],
    );
  }
}
