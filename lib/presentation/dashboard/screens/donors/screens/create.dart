import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CreateDonorScreen extends StatelessWidget {
  final controller = Get.put(CreateDonorsController());
  final void Function(dynamic)? event;

  CreateDonorScreen(this.event, {super.key});

  Future<void> create() async {
    if (controller.formKey.currentState!.validate()) {
      DonorCreateReq request = DonorCreateReq(
        firstName: controller.firstNameController.text,
        middleInitials: controller.middleInitialsController.text,
        lastName: controller.lastNameController.text,
        phone: controller.phoneController.text,
        email: controller.emailController.text,
        accountPassword: controller.passwordController.text,
        streetAddress: controller.streetAddressController.text,
        city: controller.cityController.text,
        country: controller.countryController.text,
        provinceState: controller.provinceStateController.text,
        postalZipCode: controller.postalZipCodeController.text,
      );
      console.log(request.toJson());
      await controller.create(request.toJson(), event);
    }
  }

  Widget input({
    String? label,
    String? hintText,
    TextEditingController? conn,
    bool dropDown = false,
    List<DropDown>? items,
    String? Function(String?)? validator,
    void Function(DropDown?)? onChanged,
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
            borderDecoration: OutlineInputBorder(
              borderSide: BorderSide(
                color: appTheme.gray400,
              ),
            ),
          ),
        if (dropDown)
          SimpleDropDown(
            height: 40.adaptSize,
            hintText: hintText,
            icon: CustomImageView(
              imagePath: "dropdown".icon.svg,
              height: 23.v,
              width: 34.h,
            ),
            items: items,
            onChanged: onChanged,
          ),
        SizedBox(height: 4.adaptSize),
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
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: AppbarWithBackAndFilter(
              title: "donors".tr,
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
                        validator: ValidatorDonor.firstName,
                      ),
                      input(
                        label: 'middle_name'.tr,
                        hintText: 'middle_name'.tr,
                        conn: controller.middleInitialsController,
                        validator: ValidatorDonor.middleName,
                      ),
                      input(
                        label: 'last_name'.tr,
                        hintText: 'last_name'.tr,
                        conn: controller.lastNameController,
                        validator: ValidatorDonor.lastName,
                      ),
                      input(
                        label: 'phone'.tr,
                        hintText: 'phone'.tr,
                        conn: controller.phoneController,
                        validator: (input) {
                          return ValidatorDonor.phone(input, isRequired: false);
                        },
                      ),
                      input(
                        label: 'email'.tr,
                        hintText: 'email'.tr,
                        conn: controller.emailController,
                        validator: ValidatorDonor.email,
                      ),
                      input(
                        label: 'password'.tr,
                        hintText: 'password'.tr,
                        conn: controller.passwordController,
                        validator: (input) {
                          return ValidatorDonor.password(
                            input,
                            isRequired: true,
                          );
                        },
                      ),
                      input(
                        label: 'street_address'.tr,
                        hintText: 'street_address'.tr,
                        conn: controller.streetAddressController,
                        validator: ValidatorDonor.streetAddress,
                      ),
                      input(
                        label: 'city'.tr,
                        hintText: 'city'.tr,
                        conn: controller.cityController,
                        validator: ValidatorDonor.city,
                      ),
                      Obx(
                        () => input(
                          dropDown: true,
                          label: 'country'.tr,
                          hintText: controller.country.value?.name ??
                              'select_country'.tr,
                          items: controller.countries
                              .map(
                                (country) => DropDown(
                                  id: country.code,
                                  title: country.name!,
                                  value: country,
                                ),
                              )
                              .toList(),
                          onChanged: controller.onChangedCountry,
                          validator: ValidatorDonor.country,
                        ),
                      ),
                      Obx(() {
                        if (controller.provinces.isNotEmpty) {
                          return input(
                            dropDown: true,
                            label:
                                controller.country.value!.code?.toLowerCase() ==
                                        'us'
                                    ? 'State'.tr
                                    : 'province'.tr,
                            hintText: controller.province.value == null
                                ? (controller.country.value!.code
                                            ?.toLowerCase() ==
                                        'us'
                                    ? 'State'.tr
                                    : 'province'.tr)
                                : controller.province.value?.name,
                            items: controller.provinces
                                .map(
                                  (state) => DropDown(
                                    id: state.code,
                                    title: state.name!,
                                    value: state,
                                  ),
                                )
                                .toList(),
                            onChanged: controller.onChangedCountryState,
                          );
                        } else {
                          return input(
                            label: 'province'.tr,
                            hintText: 'province'.tr,
                            conn: controller.provinceStateController,
                            validator: ValidatorDonor.province,
                          );
                        }
                      }),
                      Obx(
                        () => input(
                          label: controller.postalZipCodeLabel.value,
                          hintText: controller.postalZipCodeLabel.value,
                          conn: controller.postalZipCodeController,
                          validator: ValidatorDonor.postalZipCode,
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Obx(
                        () => CustomElevatedButton(
                          text: controller.props.useState.value == UseState.none
                              ? "add".tr
                              : "",
                          leftIcon:
                              controller.props.useState.value == UseState.none
                                  ? null
                                  : CustomProgressButton(
                                      lable: 'processing'.tr,
                                    ),
                          margin: EdgeInsets.symmetric(horizontal: 25.h),
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
