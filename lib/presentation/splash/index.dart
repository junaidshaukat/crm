import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'controller/controller.dart';

class SplashScreen extends StatelessWidget {
  final controller = Get.put(SplashController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("splash".image.png),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150.v),
            CustomImageView(
              imagePath: "logo@1".icon.svg,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 150.v),
            Lottie.asset(
              height: 100.v,
              'loading'.lottie.json,
            ),
          ],
        ),
      ),
    );
  }
}
