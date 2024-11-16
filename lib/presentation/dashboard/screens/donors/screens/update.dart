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
          accountType: controller.accountType.value.value,
          businessName: controller.accountType.value.value == "B"
              ? controller.businessNameController.text
              : null,
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
    bool dropDown2 = false,
    List<DropDown>? items,
    bool readOnly = false,
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
        if (!dropDown && !dropDown2)
          CustomTextFormField(
            controller: conn,
            hintText: "$hintText".tr,
            validator: validator,
            readOnly: readOnly,
            fillColor: appTheme.gray10001,
            contentPadding: contentPadding,
            borderDecoration: OutlineInputBorder(
              borderSide: BorderSide(
                color: appTheme.gray400,
              ),
            ),
          ),
        if (dropDown2)
          SimpleDropDown2(
            items: items,
            maxHeight: 300.v,
            hintText: hintText,
            onSelected: onChanged,
          ),
        if (dropDown)
          SimpleDropDown(
            items: items,
            maxHeight: 300.v,
            hintText: hintText,
            onSelected: onChanged,
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
                      Obx(
                        () => input(
                          dropDown2: true,
                          label: 'donor_type'.tr,
                          hintText: controller.accountType.value.name,
                          items: [
                            AccountType(
                              id: 1,
                              name: 'individual'.tr,
                              value: 'I',
                            ),
                            AccountType(
                              id: 2,
                              name: 'business'.tr,
                              value: 'B',
                            )
                          ]
                              .map(
                                (type) => DropDown(
                                  id: type.id,
                                  title: type.name,
                                  value: type,
                                ),
                              )
                              .toList(),
                          onChanged: controller.onChangedAccountType,
                          validator: ValidatorDonor.accountType,
                        ),
                      ),
                      Obx(() {
                        bool visible = controller.accountType.value.value == "B"
                            ? true
                            : false;
                        return Column(
                          children: [
                            Visibility(
                              visible: visible,
                              child: input(
                                label: 'business_name'.tr,
                                hintText: 'business_name'.tr,
                                conn: controller.businessNameController,
                                validator: visible
                                    ? ValidatorDonor.businessName
                                    : null,
                              ),
                            ),
                            input(
                              label: visible
                                  ? "${'contact'.tr} ${'first_name'.tr}"
                                  : 'first_name'.tr,
                              hintText: visible
                                  ? "${'contact'.tr} ${'first_name'.tr}"
                                  : 'first_name'.tr,
                              conn: controller.firstNameController,
                              validator: (val) {
                                return ValidatorDonor.firstName(
                                  val,
                                  visible ? 'contact'.tr : '',
                                );
                              },
                            ),
                            input(
                              label: visible
                                  ? "${'contact'.tr} ${'middle_name'.tr}"
                                  : 'middle_name'.tr,
                              hintText: visible
                                  ? "${'contact'.tr} ${'middle_name'.tr}"
                                  : 'middle_name'.tr,
                              conn: controller.middleInitialsController,
                              validator: (val) {
                                return ValidatorDonor.middleName(
                                  val,
                                  visible ? 'contact'.tr : '',
                                );
                              },
                            ),
                            input(
                              label: visible
                                  ? "${'contact'.tr} ${'last_name'.tr}"
                                  : 'last_name'.tr,
                              hintText: visible
                                  ? "${'contact'.tr} ${'last_name'.tr}"
                                  : 'last_name'.tr,
                              conn: controller.lastNameController,
                              validator: (val) {
                                return ValidatorDonor.lastName(
                                  val,
                                  visible ? 'contact'.tr : '',
                                );
                              },
                            ),
                          ],
                        );
                      }),
                      input(
                        label: 'phone'.tr,
                        hintText: donor.phone ?? 'phone'.tr,
                        conn: controller.phoneController,
                        validator: (input) {
                          return ValidatorDonor.phone(input, isRequired: false);
                        },
                      ),
                      input(
                        label: 'email_address'.tr,
                        readOnly: true,
                        hintText: donor.email ?? 'email_address'.tr,
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
                          dropDown2: true,
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
                            dropDown2: true,
                            label:
                                controller.country.value!.code?.toLowerCase() ==
                                        'us'
                                    ? 'state'.tr
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
                                  ? 'zip_code'.tr
                                  : 'postal_code'.tr,
                          hintText: donor.postalZipCode ??
                              (controller.country.value!.code?.toLowerCase() ==
                                      'us'
                                  ? 'zip_code'.tr
                                  : 'postal_code'.tr),
                          conn: controller.postalZipCodeController,
                          validator:
                              controller.country.value?.code?.toLowerCase() ==
                                      'us'
                                  ? ValidatorDonor.zipCode
                                  : ValidatorDonor.postalCode,
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
