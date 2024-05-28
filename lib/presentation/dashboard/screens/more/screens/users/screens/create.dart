import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CreateUsersScreen extends StatelessWidget {
  final controller = Get.put(CreateUsersController());
  final void Function(dynamic)? event;

  CreateUsersScreen(this.event, {super.key});

  Future<void> create() async {
    if (controller.formKey.currentState!.validate()) {
      UsersCreateReq request = UsersCreateReq(
        firstName: controller.firstNameController.text,
        lastName: controller.lastNameController.text,
        email: controller.emailController.text,
        accountPassword: controller.accountPasswordController.text,
        status: controller.status.value,
      );
      await controller.create(request.toJson(), event);
    }
  }

  Widget input({
    String? label,
    String? hintText,
    TextEditingController? conn,
    bool dropDown = false,
    bool enabled = true,
    List<DropDown>? items,
    String? Function(String?)? validator,
    void Function(DropDown?)? onChanged,
    EdgeInsets? contentPadding,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4.adaptSize),
        Text(
          "$label".tr,
          style: TextStyle(
            color: appTheme.gray80001,
            fontSize: 14.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 2.adaptSize),
        if (!dropDown)
          CustomTextFormField(
            controller: conn,
            hintText: "$hintText".tr,
            validator: validator,
            fillColor: appTheme.gray10001,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                  vertical: 16.v,
                  horizontal: 8.h,
                ),
            borderDecoration: OutlineInputBorder(
              borderSide: BorderSide(
                color: appTheme.gray400,
              ),
            ),
          ),
        if (dropDown)
          SimpleDropDown(
            height: 360,
            width: 340.h,
            enabled: enabled,
            hintText: hintText,
            items: items,
            onSelected: onChanged,
          ),
        SizedBox(height: 4.adaptSize),
      ],
    );
  }

  Widget customSwitch({
    required String label,
    num width = 50,
    bool? value,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    required dynamic Function(bool) onChange,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        SizedBox(height: 14.v),
        Text(
          label,
          overflow: TextOverflow.clip,
          maxLines: 2,
          style: TextStyle(
            color: appTheme.gray80001,
            fontSize: 14.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 2.v),
        SizedBox(
          width: width.h,
          child: FittedBox(
            fit: BoxFit.cover,
            child: CustomSwitch(
              value: value,
              onChange: onChange,
            ),
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
              title: "add_users".tr,
            ),
          ),
          SizedBox(height: 16.v),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
              decoration: AppDecoration.outlinePrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL28,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 14.v),
                      const Center(child: CustomDivider()),
                      SizedBox(height: 19.v),
                      input(
                        label: 'first_name'.tr,
                        hintText: 'first_name'.tr,
                        conn: controller.firstNameController,
                        validator: ValidatorUser.firstName,
                      ),
                      input(
                        label: 'last_name'.tr,
                        hintText: 'last_name'.tr,
                        conn: controller.lastNameController,
                        validator: ValidatorUser.lastName,
                      ),
                      input(
                        label: 'email_address'.tr,
                        hintText: 'email_address'.tr,
                        conn: controller.emailController,
                        validator: ValidatorUser.email,
                      ),
                      input(
                        label: 'password'.tr,
                        hintText: 'password'.tr,
                        conn: controller.accountPasswordController,
                        validator: ValidatorUser.password,
                      ),
                      input(
                        dropDown: true,
                        enabled: false,
                        label: 'language'.tr,
                        hintText: 'english'.tr,
                        items: [Languages(name: 'english'.tr, code: 'en')]
                            .map(
                              (language) => DropDown(
                                id: language.code,
                                title: language.name,
                                value: language.code,
                              ),
                            )
                            .toList(),
                        onChanged: null,
                      ),
                      Obx(
                        () => customSwitch(
                          label: "status".tr,
                          value: controller.status.value,
                          onChange: (value) {
                            controller.status(value);
                          },
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Obx(
                        () => CustomElevatedButton(
                          text: controller.props.useState.value == UseState.none
                              ? "add_user".tr
                              : "",
                          leftIcon:
                              controller.props.useState.value == UseState.none
                                  ? null
                                  : CustomProgressButton(
                                      lable: 'processing'.tr,
                                    ),
                          onPressed: create,
                        ),
                      ),
                      SizedBox(height: 16.v),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
