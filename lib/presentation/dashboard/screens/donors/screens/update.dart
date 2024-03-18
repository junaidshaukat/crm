import 'package:flutter/material.dart';
import '/core/app_export.dart';

class UpdateDonorScreen extends StatelessWidget {
  final DonorData donor;
  final controller = Get.put(UpdateDonorsController());
  final void Function(dynamic)? event;

  UpdateDonorScreen(this.donor, this.event, {super.key}) {
    controller.setTextEditingController(donor);
  }

  Future<void> create() async {
    if (controller.props.useState.value == UseState.none) {
      if (controller.formKey.currentState!.validate()) {
        DonorUpdateReq request = DonorUpdateReq(
          firstName: controller.firstNameController.text,
          middleName: controller.middleInitialsController.text,
          lastName: controller.lastNameController.text,
          phone: controller.phoneController.text,
          email: controller.emailController.text,
          accountPassword: controller.passwordController.text,
          streetAddress: controller.streetAddressController.text,
          city: controller.cityController.text,
          country: controller.countryController.text,
          provinceState: controller.province.value?.code,
          postalZipCode: controller.postalZipCodeController.text,
          status: donor.status.toString(),
          allowContact: donor.allowContact.toString(),
          notifyNewCampaign: donor.notifyNewCampaign.toString(),
        );
        console.log(request.toJson());
        await controller.updateDonor(
          donor.tagNumber.toString(),
          request.toJson(),
          event: event,
        );
      }
    }
  }

  Widget input({
    String? label,
    String? hintText,
    TextEditingController? conn,
    bool dropDown = false,
    List<DropDown>? items,
    bool readOnly = false,
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
            readOnly: readOnly,
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
    console.log(donor.provinceState);
    console.log(donor.country);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 64.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: AppbarWithBackAndFilter(
              title: "update_donor".tr,
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
                        hintText: donor.firstName ?? 'first_name'.tr,
                        conn: controller.firstNameController,
                        validator: ValidatorDonor.firstName,
                      ),
                      input(
                        label: 'middle_name'.tr,
                        hintText: donor.middleName ?? 'middle_name'.tr,
                        conn: controller.middleInitialsController,
                        validator: ValidatorDonor.middleName,
                      ),
                      input(
                        label: 'last_name'.tr,
                        hintText: donor.lastName ?? 'last_name'.tr,
                        conn: controller.lastNameController,
                        validator: ValidatorDonor.lastName,
                      ),
                      input(
                        label: 'phone'.tr,
                        hintText: donor.phone ?? 'phone'.tr,
                        conn: controller.phoneController,
                        validator: (input) {
                          return ValidatorDonor.phone(input, isRequired: false);
                        },
                      ),
                      input(
                        label: 'email'.tr,
                        readOnly: true,
                        hintText: donor.email ?? 'email'.tr,
                        conn: controller.emailController,
                        validator: ValidatorDonor.email,
                      ),
                      input(
                        label: 'password'.tr,
                        readOnly: true,
                        hintText: donor.accountPassword ?? 'password'.tr,
                        conn: controller.passwordController,
                        validator: ValidatorDonor.password,
                      ),
                      input(
                        label: 'street_address'.tr,
                        hintText: donor.streetAddress ?? 'street_address'.tr,
                        conn: controller.streetAddressController,
                        validator: ValidatorDonor.streetAddress,
                      ),
                      input(
                        label: 'city'.tr,
                        hintText: donor.city ?? 'city'.tr,
                        conn: controller.cityController,
                        validator: ValidatorDonor.city,
                      ),
                      Obx(
                        () => input(
                          dropDown: true,
                          label: 'country'.tr,
                          hintText: controller.country.value?.name ??
                              controller.countryController.text,
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
                                ? 'province'.tr
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
                            hintText: controller.provinceStateController.text,
                            conn: controller.provinceStateController,
                            validator: ValidatorDonor.province,
                          );
                        }
                      }),
                      Obx(
                        () => input(
                          label:
                              controller.country.value?.code?.toLowerCase() ==
                                      'us'
                                  ? 'Zip Code'.tr
                                  : 'Postal Code'.tr,
                          hintText: donor.postalZipCode ??
                              (controller.country.value!.code?.toLowerCase() ==
                                      'us'
                                  ? 'Zip Code'
                                  : 'Postal Code'),
                          conn: controller.postalZipCodeController,
                          validator: ValidatorDonor.postalZipCode,
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Obx(
                        () => CustomElevatedButton(
                          text: controller.props.useState.value == UseState.none
                              ? "update".tr
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
