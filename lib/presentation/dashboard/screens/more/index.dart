import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';
export 'screens/export.dart';
export 'widgets/export.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({super.key});

  final controller = Get.put(MoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() {
        String version = controller.version.value;
        return SizedBox(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Version $version',
                style: TextStyle(
                  fontSize: 14.fSize,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
      }),
      body: Column(
        children: [
          SizedBox(height: 36.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: AppbarWithBackAndFilter(
              back: false,
              title: "more".tr,
            ),
          ),
          SizedBox(height: 16.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              decoration: AppDecoration.outlinePrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL28,
              ),
              child: Column(
                children: [
                  SizedBox(height: 16.v),
                  const CustomDivider(),
                  SizedBox(height: 16.v),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 14.v,
                    ),
                    decoration: AppDecoration.fillWhiteA.copyWith(
                      border: Border.all(color: appTheme.primary),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Obx(() {
                      Rx<UseState> useState = controller.props.useState;
                      if (useState.value == UseState.none ||
                          useState.value == UseState.loading) {
                        return const CircularProgress();
                      } else {
                        ProfileData? profile = controller.profile.value;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 44.adaptSize,
                              height: 44.adaptSize,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.h,
                                vertical: 1.v,
                              ),
                              decoration: AppDecoration.fillPrimary.copyWith(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                "${profile?.firstName.toString().avatar}${profile?.lastName.toString().avatar}",
                                style: TextStyle(
                                  color: appTheme.whiteA700,
                                  fontSize: 20.fSize,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 6.h,
                                top: 4.v,
                                bottom: 5.v,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${profile?.firstName} ${profile?.lastName}",
                                    style: TextStyle(
                                      color: theme.colorScheme.onPrimary,
                                      fontSize: 14.fSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '${profile?.email}',
                                    style: TextStyle(
                                      color: appTheme.gray600,
                                      fontSize: 10.fSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.all(12)),
                              onPressed: controller.logout,
                              child: Text('logout'.tr),
                            )
                          ],
                        );
                      }
                    }),
                  ),
                  listTile(
                    fundsLineImage: "transactions".icon.svg,
                    languageText: "transactions".tr,
                    onTap: () {
                      Get.to(() => TransactionsScreen());
                    },
                  ),
                  listTile(
                    fundsLineImage: "channels".icon.svg,
                    languageText: "channels".tr,
                    onTap: () {
                      Get.to(() => ChannelsScreen());
                    },
                  ),
                  listTile(
                    fundsLineImage: "organization".icon.svg,
                    languageText: "organization".tr,
                    onTap: () {
                      Get.to(() => OrganizationScreen());
                    },
                  ),
                  listTile(
                    fundsLineImage: "media_centre".icon.svg,
                    languageText: "media_centre".tr,
                    onTap: () {
                      Get.to(() => MediaCentreScreen());
                    },
                  ),
                  listTile(
                    fundsLineImage: "reports".icon.svg,
                    languageText: "reports".tr,
                    onTap: () {
                      Get.to(() => ReportsScreen());
                    },
                  ),
                  listTile(
                    fundsLineImage: "user".icon.svg,
                    languageText: "user".tr,
                    onTap: () {
                      Get.to(() => UsersScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget listTile({
    required String fundsLineImage,
    required String languageText,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.v),
          Padding(
            padding: EdgeInsets.only(
              left: 4.h,
              right: 5.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: fundsLineImage,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.h),
                  child: Text(
                    languageText,
                    style: TextStyle(
                      color: appTheme.gray900,
                      fontSize: 14.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                CustomImageView(
                  imagePath: "arrow_right".icon.svg,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.v),
          const Divider(),
        ],
      ),
    );
  }
}
