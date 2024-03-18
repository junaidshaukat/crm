import 'package:flutter/material.dart';
import '/core/app_export.dart';

class OrganizationAddressController extends GetxController {
  Props props = Props();

  Rx<CountryData?> country = Rx(null);
  Rx<CountrySatesData?> province = Rx(null);

  RxList<CountryData> countries = RxList([]);
  RxList<CountrySatesData> provinces = RxList([]);
  Rx<String> postalZipCodeLabel = Rx("Postal Code");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController streetAddressController = TextEditingController();
  TextEditingController unitNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController provinceStateController = TextEditingController();
  TextEditingController postalZipCodeController = TextEditingController();

  Future<void> setTextEditingController(OrganizationData organization) async {
    props.useState(UseState.loading);
    await getCountries(organization.country);
    await getCountryStates(country.value!.code!,
        name: organization.provinceState);
    streetAddressController.text = organization.streetAddress ?? '';
    unitNumberController.text = organization.unitNumber ?? '';
    cityController.text = organization.city ?? '';
    countryController.text = organization.country ?? '';
    provinceStateController.text = organization.provinceState ?? '';
    postalZipCodeController.text = organization.postalZipCode ?? '';
    props.useState(UseState.done);
  }

  @override
  void onClose() {
    super.onClose();
    streetAddressController.dispose();
    unitNumberController.dispose();
    cityController.dispose();
    countryController.dispose();
    postalZipCodeController.dispose();
    provinceStateController.dispose();
  }

  void clear() {
    streetAddressController.clear();
    unitNumberController.clear();
    cityController.clear();
    postalZipCodeController.clear();
    provinceStateController.clear();
    country.value = null;
    province.value = null;
    update();
  }

  void onChangedCountry(option) {
    country(option.value);
    countryController.text = option.value.name;
    province.value = null;
    if (option.value.code.toString().trim().toLowerCase() == 'ca') {
      postalZipCodeLabel('Postal Code');
    } else if (option.value.code.toString().trim().toLowerCase() == 'us') {
      postalZipCodeLabel('Zip Code');
    } else {
      postalZipCodeLabel('Postal/Zip Code');
    }
    getCountryStates(option.value.code);
  }

  void onChangedCountryState(option) {
    province(option.value);
    provinceStateController.text = option.value.name;
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

  Future getCountryStates(String countryCode, {String? name}) async {
    try {
      console.log({countryCode, name}, name: 'getCountryStates');
      CountryStateReq request = CountryStateReq(countryCode: countryCode);
      CountryStateRes response = await Get.find<Api>().public.states(
            requestData: request.toJson(),
          );
      if (response.data!.isNotEmpty) {
        provinces.clear();
        provinces(response.data);
        for (var element in response.data!) {
          if (name != null) {
            if (element.name == name) {
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
      OrganizationAddressUpdateRes response =
          await Get.find<Api>().organization.organizationAddressUpdate(
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
