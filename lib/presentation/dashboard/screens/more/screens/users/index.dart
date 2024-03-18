import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'binding/binding.dart';
export 'controller/controller.dart';
export 'models/model.dart';
export 'screens/export.dart';
export 'widgets/export.dart';

class UsersScreen extends StatelessWidget {
  final controller = Get.put(UsersController());
  UsersScreen({super.key});

  void onPressedAdd() {
    Get.to(() => CreateUsersScreen(
          (event) {
            if (event == "update") {
              controller.reloadData();
            }
          },
        ));
  }

  void onPressedEdit(Users user) {
    Get.to(() => UpdateUsersScreen(
          user,
          (event) {
            if (event == "update") {
              controller.reloadData();
            }
          },
        ));
  }

  void onPressedDelete(num? tagNumber) {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.only(bottom: 0.v),
        content: Container(
          decoration: AppDecoration.fillPrimary.copyWith(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.adaptSize),
              topRight: Radius.circular(8.adaptSize),
            ),
          ),
          width: 260.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(6.h),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.adaptSize),
                    topRight: Radius.circular(8.adaptSize),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "delete_user".tr,
                      style: TextStyle(
                        color: appTheme.whiteA700,
                        fontSize: 12.fSize,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CustomImageView(
                      imagePath: "close".icon.svg,
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      onTap: () {
                        if (controller.props.useState.value !=
                            UseState.deleting) {
                          Get.back();
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.v),
              Obx(() {
                if (controller.props.useState.value == UseState.deleting) {
                  return Padding(
                    padding: EdgeInsets.all(16.adaptSize),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomProgressButton(
                            lable: 'deleting'.tr,
                            indicatorColor: theme.primaryColor,
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Text(
                          "delete_user_message".tr,
                          style: TextStyle(
                            color: appTheme.redA700,
                            fontSize: 12.fSize,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Text(
                          "you_cannot_undo".tr,
                          style: TextStyle(
                            color: appTheme.redA700,
                            fontSize: 12.fSize,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.v),
                    ],
                  );
                }
              }),
              Padding(
                padding: EdgeInsets.only(right: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                      height: 32.v,
                      width: 80.h,
                      text: "cancel".tr,
                      buttonStyle: CustomButtonStyles.fillGray,
                      onPressed: () {
                        if (controller.props.useState.value !=
                            UseState.deleting) {
                          Get.back();
                        }
                      },
                    ),
                    SizedBox(width: 8.v),
                    CustomElevatedButton(
                      height: 32.v,
                      width: 100.h,
                      text: "delete".tr,
                      buttonStyle: CustomButtonStyles.fillRedA,
                      onPressed: () async {
                        controller.delete(tagNumber);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.v),
            ],
          ),
        ),
      ),
    );
  }

  cell({required String label, required String value, bool? status}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: appTheme.gray80001,
            fontSize: 10.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 9.v),
        if (status != null)
          Icon(
            Icons.check_circle_rounded,
            size: 20,
            color: status == false ? appTheme.yellow800 : appTheme.green900,
          ),
        if (status == null)
          Text(
            value,
            style: TextStyle(
              color: appTheme.gray80001,
              fontSize: 9.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
            ),
          ),
      ],
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
              title: "users".tr,
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
                  SizedBox(height: 14.v),
                  const CustomDivider(),
                  SizedBox(height: 19.v),
                  InkWell(
                    onTap: onPressedAdd,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: "plus_circle".icon.svg,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 7.h,
                            top: 2.v,
                            bottom: 3.v,
                          ),
                          child: Text(
                            "add_user".tr,
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontSize: 12.fSize,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 19.v),
                  Expanded(
                    child: Obx(
                      () {
                        Rx<UseState> useState = controller.props.useState;
                        Rx<UseError> error = controller.props.error;

                        if (useState.value == UseState.loading) {
                          return SizedBox(
                            height: 400.v,
                            child: const Center(
                              child: CircularProgress(),
                            ),
                          );
                        } else {
                          if (error.value.message != null) {
                            return TryAgain(
                              message: error.value.message,
                              tryAgain: controller.tryAgain,
                            );
                          } else {
                            if (controller.users.isEmpty) {
                              return const Center(
                                child: Text('No Recod Found'),
                              );
                            }

                            return ListView.separated(
                              itemCount: controller.users.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                Users user = controller.users[index];
                                return CustomCard(
                                  padding: EdgeInsets.zero,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 8.v),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 3.h,
                                          vertical: 1.v,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 44.adaptSize,
                                              height: 44.adaptSize,
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 3.h,
                                                vertical: 1.v,
                                              ),
                                              decoration: AppDecoration
                                                  .fillPrimary
                                                  .copyWith(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: Text(
                                                "${user.firstName.toString().avatar}${user.lastName.toString().avatar}",
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${user.firstName} ${user.lastName}",
                                                    style: TextStyle(
                                                      color: theme.colorScheme
                                                          .onPrimary,
                                                      fontSize: 14.fSize,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${user.email}',
                                                    style: TextStyle(
                                                      color: appTheme.gray600,
                                                      fontSize: 10.fSize,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16.v, horizontal: 8.h),
                                        decoration:
                                            AppDecoration.fillLightGreen,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            cell(
                                                label: 'status'.tr,
                                                value: '${user.status}',
                                                status:
                                                    controller.getStatus(user)),
                                            cell(
                                                label: 'language'.tr,
                                                value: '${user.language}'),
                                            cell(
                                                label: 'created'.tr,
                                                value: '${user.createDateTime}'
                                                    .dateTime),
                                            cell(
                                                label: 'updated'.tr,
                                                value: '${user.updateDateTime}'
                                                    .dateTime),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 8.v),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomElevatedButton(
                                            height: 29.v,
                                            width: 65.h,
                                            text: "edit".tr,
                                            buttonStyle: CustomButtonStyles
                                                .fillPrimaryTL4,
                                            onPressed: () {
                                              onPressedEdit(user);
                                            },
                                          ),
                                          SizedBox(width: 3.v),
                                          CustomElevatedButton(
                                            height: 29.v,
                                            width: 65.h,
                                            text: "delete".tr,
                                            buttonStyle:
                                                CustomButtonStyles.fillRed,
                                            onPressed: () {
                                              onPressedDelete(user.tagNumber);
                                            },
                                          ),
                                          SizedBox(width: 8.v),
                                        ],
                                      ),
                                      SizedBox(height: 8.v),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 8.v);
                              },
                            );
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 19.v),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
