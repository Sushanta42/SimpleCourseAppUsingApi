import 'package:flutter/material.dart';

import '../util/color.dart';
import '../util/size.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.kPrimary,
            Color.fromARGB(255, 19, 104, 169),
          ],
        ),
      ),
      width: AppLayOut.screenWidth,
      height: 170,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: AppLayOut.screenWidth * .90,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search Course',
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search)),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  border: const OutlineInputBorder()),
            ),
          ),
          const SizedBox(height: AppLayOut.vs),
          const Text(
            "Flutter | Laravel | RestFul API | Java | Node JS",
            style: TextStyle(color: Colors.white70),
          )
        ],
      ),
    );
  }
}
