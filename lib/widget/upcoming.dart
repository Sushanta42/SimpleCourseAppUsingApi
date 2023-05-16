import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:codeit/view/syllabus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/coursecontroller.dart';
import '../util/size.dart';
import 'listtile.dart';

class UpcomingWidget extends StatelessWidget {
  const UpcomingWidget({
    Key? key,
    required this.upcomingController,
  }) : super(key: key);

  final CourseController upcomingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTileWidget(
          title: "Upcoming Class",
          // subtitle: "Make Your Carrer in IT",
        ),
        SizedBox(
          width: AppLayOut.screenWidth,
          height: 120,
          child: CarouselSlider(
            options: CarouselOptions(autoPlay: true),
            items: upcomingController.upcoming.value.data.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: (){
                      upcomingController.getSyllabusDetail(i.courseId);
                      Get.to(() => const SyllabusView());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      color: Colors.grey.shade100,
                      child: ListTile(
                        leading: SizedBox(
                          width: 91,
                          height: 100,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: "${i.image}",
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
                        title: FittedBox(child: Text("${i.courseName}")),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("${i.duration}"),
                                const SizedBox(
                                  width: AppLayOut.hs,
                                ),
                                Text("${i.classType}"),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.event),
                                Text("${i.date}"),
                                const SizedBox(
                                  width: AppLayOut.hs,
                                ),
                                const Icon(Icons.timer, size: 15,),
                                Text("${i.time}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
