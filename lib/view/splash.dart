import 'package:codeit/util/string.dart';
import 'package:codeit/view/home.dart';
import 'package:codeit/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  checkAuth() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var onboard = preferences.getString('onboard');
    if (onboard != null) {
      Future.delayed(
        const Duration(seconds: 5),
        () {
          Get.offAll(() => const HomeView());
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 5),
        () {
          Get.offAll(() => const OnBoarding());
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 40,
          alignment: Alignment.center,
          child: const Text.rich(
            TextSpan(children: [
              TextSpan(text: 'Powered by: '),
              TextSpan(
                text: 'CODE IT',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
        body: Center(
          child: Lottie.asset(AppImage.splashImage),
        ),
      ),
    );
  }
}
