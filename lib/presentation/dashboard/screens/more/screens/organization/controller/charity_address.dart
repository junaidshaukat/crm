import 'package:flutter/material.dart';
import '/core/app_export.dart';

class OrganizationCharityAddressController extends GetxController {
  Props props = Props();

  Rx<CountryData?> country = Rx(null);
  Rx<CountrySatesData?> province = Rx(null);

  RxList<CountryData> countries = RxList([]);
  RxList<CountrySatesData> provinces = RxList([]);
  Rx<String> charityPostalZipCodeLabel = Rx("postal_code".tr);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController charityStreetAddressController =
      TextEditingController();
  TextEditingController charityUnitNumberController = TextEditingController();
  TextEditingController charityCityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController charityProvinceStateController =
      TextEditingController();
  TextEditingController charityPostalZipCodeController =
      TextEditingController();

  Future<void> setTextEditingController(OrganizationData organization) async {
    props.useState(UseState.loading);

    charityStreetAddressController.text =
        organization.charityStreetAddress ?? '';
    charityUnitNumberController.text = organization.charityUnitNumber ?? '';
    charityCityController.text = organization.charityCity ?? '';
    countryController.text = organization.country ?? '';
    charityProvinceStateController.text =
        organization.charityProvinceState ?? '';
    charityPostalZipCodeController.text =
        organization.charityPostalZipCode ?? '';

    await getCountries(organization.country);
    await getCountryStates(
      country.value!.code!,
      provinceState: organization.charityProvinceState,
    );
    props.useState(UseState.done);
  }

  @override
  void onClose() {
    super.onClose();
    charityStreetAddressController.dispose();
    charityUnitNumberController.dispose();
    charityCityController.dispose();
    countryController.dispose();
    charityPostalZipCodeController.dispose();
    charityProvinceStateController.dispose();
  }

  void clear() {
    charityStreetAddressController.clear();
    charityUnitNumberController.clear();
    charityCityController.clear();
    charityPostalZipCodeController.clear();
    charityProvinceStateController.clear();
    country.value = null;
    province.value = null;
    update();
  }

  Future<void> onChangedCountry(option) async {
    provinces.clear();
    country(option.value);
    countryController.text = option.value.name;
    province.value = null;
    if (option.value.code.toString().trim().toLowerCase() == 'ca') {
      charityPostalZipCodeLabel.value = "postal_code".tr;
    } else if (option.value.code.toString().trim().toLowerCase() == 'us') {
      charityPostalZipCodeLabel.value = "zip_code".tr;
    } else {
      charityPostalZipCodeLabel.value = "postal_code".tr;
    }
    await getCountryStates(option.value.code);
  }

  void onChangedCountryState(option) {
    province(option.value);
    charityProvinceStateController.text = option.value.name;
  }

  Future getCountries(String? name) async {
    try {
      CountryRes response = await Get.find<Api>().public.country();
      if (response.data!.isNotEmpty) {
        countries(response.data);
        for (var element in response.data!) {
          if (element.name == name) {
            country.value = element;
          }
        }

        if (country.value == null) {
          country.value = response.data?.first;
          countryController.text = country.value!.name!;
        }

        if (country.value?.code.toString().trim().toLowerCase() == 'ca') {
          charityPostalZipCodeLabel.value = 'postal_code'.tr;
        } else if (country.value?.code.toString().trim().toLowerCase() ==
            'us') {
          charityPostalZipCodeLabel.value = 'zip_code'.tr;
        } else {
          charityPostalZipCodeLabel.value = 'postal_code'.tr;
        }
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      Toasts.error(
        message: e.toString(),
      );
    }
  }

  Future getCountryStates(String countryCode, {String? provinceState}) async {
    try {
      CountryStateReq request = CountryStateReq(countryCode: countryCode);
      CountryStateRes response = await Get.find<Api>().public.states(
            requestData: request.toJson(),
          );
      if (response.data!.isNotEmpty) {
        provinces.clear();
        provinces(response.data);
        for (var element in response.data!) {
          if (provinceState != null) {
            if (element.code == provinceState) {
              province.value = element;
            }
          }
        }
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      Toasts.error(
        message: e.toString(),
      );
    }
  }

  Future save(
    int? tagNumber,
    Map<String, dynamic> requestData, {
    void Function(dynamic)? event,
  }) async {
    try {
      props.useState(UseState.processing);
      OrganizationSupplementaryCharityDataUpdateRes response =
          await Get.find<Api>().organization.charityAddressUpdate(
                requestData: requestData,
                tagNumber: tagNumber,
              );

      if (response.result == true) {
        props.useState(UseState.done);
        event!("update");
        Get.back();
        Toasts.success(
          message: response.message.toString(),
        );
      } else {
        throw response;
      }
    } on DonorUpdateRes catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    }
  }

  void tryAgain() async {}
}
