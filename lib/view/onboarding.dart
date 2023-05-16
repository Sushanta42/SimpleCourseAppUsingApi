import 'package:codeit/view/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        onFinish: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString('onboard', 'done');
          Get.offAll(() => const HomeView());
        },
        finishButtonText: 'Continue',
        skipFunctionOverride: () async{
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString('onboard', 'done');
          Get.offAll(() => const HomeView());
        },
        skipTextButton: const Text('Skip'),
        // trailing: const Text('Login'),
        background: [
          Image.asset(
            'images/sp.jpg',
            height: 420,
            width: Get.size.width,
          ),
          Image.asset(
            'images/sp.jpg',
            height: 420,
            width: Get.size.width,
          ),
        ],
        totalPage: 2,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: const [
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 1'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: const [
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 2'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
