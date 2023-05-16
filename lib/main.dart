import 'package:codeit/binding/controllerbinding.dart';
import 'package:codeit/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Code IT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // colorSchemeSeed: AppColor.kPrimary,
      ),
      initialBinding: ControllerBinding(),
      home: const SplashView(),
    );
  }
}
