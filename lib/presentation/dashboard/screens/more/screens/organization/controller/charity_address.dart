import 'package:flutter/material.dart';
import '/core/app_export.dart';

class OrganizationCharityAddressController extends GetxController {
  Props props = Props();

  Rx<CountryData?> country = Rx(null);
  Rx<CountrySatesData?> province = Rx(null);

  RxList<CountryData> countries = RxList([]);
  RxList<CountrySatesData> provinces = RxList([]);
  Rx<String> charityPostalZipCodeLabel = Rx("Postal Code");

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
    await getCountries(organization.country);
    await getCountryStates(
      country.value!.code!,
      code: organization.charityProvinceState,
    );
    charityStreetAddressController.text =
        organization.charityStreetAddress ?? '';
    charityUnitNumberController.text = organization.charityUnitNumber ?? '';
    charityCityController.text = organization.charityCity ?? '';
    countryController.text = organization.country ?? '';
    charityProvinceStateController.text =
        organization.charityProvinceState ?? '';
    charityPostalZipCodeController.text =
        organization.charityPostalZipCode ?? '';
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

  void onChangedCountry(option) {
    country(option.value);
    countryController.text = option.value.name;
    province.value = null;
    if (option.value.code.toString().trim().toLowerCase() == 'ca') {
      charityPostalZipCodeLabel('Postal Code');
    } else if (option.value.code.toString().trim().toLowerCase() == 'us') {
      charityPostalZipCodeLabel('Zip Code');
    } else {
      charityPostalZipCodeLabel('Postal/Zip Code');
    }
    getCountryStates(option.value.code);
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
            country(element);
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

  Future getCountryStates(String countryCode, {String? code}) async {
    try {
      console.log({countryCode, code}, name: 'getCountryStates');

      CountryStateReq request = CountryStateReq(countryCode: countryCode);
      CountryStateRes response = await Get.find<Api>().public.states(
            requestData: request.toJson(),
          );
      if (response.data!.isNotEmpty) {
        provinces.clear();
        provinces(response.data);

        for (var element in response.data!) {
          console.log({countryCode, code, element.toJson()},
              name: 'getCountryStates');

          if (code != null) {
            if (element.code == code) {
              province(element);
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

  void tryAgain() async {}

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
}
