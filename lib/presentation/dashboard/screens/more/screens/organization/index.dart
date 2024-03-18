import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';
export 'screens/export.dart';

class OrganizationScreen extends StatelessWidget {
  OrganizationScreen({super.key});
  final controller = Get.put(OrganizationController());

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 64.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: AppbarWithBackAndFilter(
              back: true,
              title: "organization".tr,
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
              child: Obx(
                () {
                  UseState useState = controller.props.useState.value;
                  UseError useError = controller.props.error.value;

                  if (useState == UseState.none ||
                      useState == UseState.loading) {
                    return const CircularProgress();
                  } else {
                    if (useError.message != null) {
                      return TryAgain(tryAgain: () async {
                        useError.message = null;
                        controller.getOrganization();
                      });
                    }
                    return Column(
                      children: [
                        SizedBox(height: 16.v),
                        const CustomDivider(),
                        SizedBox(height: 16.v),
                        listTile(
                          fundsLineImage: "profile".icon.svg,
                          languageText: "profile".tr,
                          onTap: () {
                            Get.to(
                              () => OrganizationProfileScreen(
                                organization: controller.organization.value,
                                (event) {
                                  controller.getOrganization();
                                },
                              ),
                            );
                          },
                        ),
                        listTile(
                          fundsLineImage: "address".icon.svg,
                          languageText: "address".tr,
                          onTap: () {
                            Get.to(
                              () => OrganizationAddressScreen(
                                organization: controller.organization.value,
                                (event) {
                                  controller.getOrganization();
                                },
                              ),
                            );
                          },
                        ),
                        listTile(
                          fundsLineImage: "supplementary_data".icon.svg,
                          languageText: "supplementary_data".tr,
                          onTap: () {
                            Get.to(
                              () => OrganizationSupplementaryDataScreen(
                                organization: controller.organization.value,
                                (event) {
                                  controller.getOrganization();
                                },
                              ),
                            );
                          },
                        ),
                        listTile(
                          fundsLineImage: "charity".icon.svg,
                          languageText: "charity".tr,
                          onTap: () {
                            Get.to(
                              () => CharityScreen(
                                (event) {
                                  controller.getOrganization();
                                },
                              ),
                            );
                          },
                        ),
                        listTile(
                          fundsLineImage: "contact".icon.svg,
                          languageText: "contact".tr,
                          onTap: () {
                            Get.to(
                              () => OrganizationContactScreen(
                                organization: controller.organization.value,
                                (event) {
                                  controller.getOrganization();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
