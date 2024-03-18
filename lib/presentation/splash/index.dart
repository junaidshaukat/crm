import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 140.adaptSize,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("bg@1".image.png),
                fit: BoxFit.cover,
              ),
            ),
            child: CustomImageView(
              imagePath: "logo@1".icon.svg,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 49.v),
          LoadingAnimationWidget.waveDots(
            width: 80.h,
            size: 30.v,
            color: Colors.white,
          ),
          SizedBox(height: 49.v),
          SizedBox(
            height: 156.v,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.4,
                  child: CustomImageView(
                    height: 156.v,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    imagePath: "path@1".image.png,
                  ),
                ),
                Opacity(
                  opacity: 0.4,
                  child: CustomImageView(
                    height: 156.v,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    imagePath: "path@2".image.png,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
