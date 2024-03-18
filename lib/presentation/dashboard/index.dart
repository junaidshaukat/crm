import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';
export 'screens/export.dart';

class DashboardScreen extends GetWidget<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray8000,
      body: SafeArea(
        child: Obx(
          () {
            switch (controller.currentPage.value) {
              case 0:
                return DonorsScreen();
              case 1:
                return AnalyticsScreen(
                    controller: Get.put(AnalyticsController()));
              case 2:
                return HomeScreen(controller: Get.put(HomeController()));
              case 3:
                return CompaignScreen();
              case 4:
                return MoreScreen();
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Colors.white,
        circleColor: Colors.white,
        activeIconColor: Colors.green,
        inactiveIconColor: Colors.grey,
        textColor: Colors.green,
        tabs: [
          TabData(
            icon: "donors".icon.svg,
            title: "donors".tr,
          ),
          TabData(
            icon: "analytics".icon.svg,
            title: "analytics".tr,
          ),
          TabData(
            icon: "home".icon.svg,
            title: "home".tr,
          ),
          TabData(
            icon: "campaign".icon.svg,
            title: "campaign".tr,
          ),
          TabData(
            icon: "more_circle".icon.svg,
            title: "more".tr,
          ),
        ],
        initialSelection: 2,
        onTabChangedListener: (position) {
          controller.currentPage.value = position;
        },
      ),
    );
  }
}
