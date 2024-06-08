import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'screens/export.dart';
export 'controller/controller.dart';

class DashboardScreen extends StatelessWidget {
  final controller = Get.put(DashboardController());

  DashboardScreen({super.key});

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
                return AnalyticsScreen();
              case 2:
                return HomeScreen();
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
      bottomNavigationBar: BottomNavigation(
        barBackgroundColor: Colors.white,
        circleColor: Colors.white,
        activeIconColor: Colors.green,
        inactiveIconColor: Colors.grey,
        textColor: Colors.green,
        tabs: [
          TabData(
            title: "donors".tr,
            icon: "donors".icon.svg,
          ),
          TabData(
            title: "analytics".tr,
            icon: "analytics".icon.svg,
          ),
          TabData(
            title: "home".tr,
            icon: "home".icon.svg,
          ),
          TabData(
            title: "campaign".tr,
            icon: "campaign".icon.svg,
          ),
          TabData(
            title: "more".tr,
            icon: "more_circle".icon.svg,
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
