import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CreateDonorsController extends GetxController {
  Props props = Props();
  Props propsCountries = Props();
  Props propsStates = Props();

  Rx<CountryData?> country = Rx(null);
  Rx<CountrySatesData?> province = Rx(null);

  RxList<CountryData> countries = RxList([]);
  RxList<CountrySatesData> provinces = RxList([]);
  Rx<String> postalZipCodeLabel = Rx("Postal Code");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleInitialsController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController provinceStateController = TextEditingController();
  TextEditingController postalZipCodeController = TextEditingController();

  @override
  void onReady() async {
    super.onReady();
    await Future.wait([
      getCountries(),
    ]);
  }

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    middleInitialsController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    streetAddressController.dispose();
    cityController.dispose();
    countryController.dispose();
    postalZipCodeController.dispose();
    provinceStateController.dispose();
  }

  void clear() {
    firstNameController.clear();
    middleInitialsController.clear();
    lastNameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    streetAddressController.clear();
    cityController.clear();
    countryController.clear();
    postalZipCodeController.clear();
    provinceStateController.clear();
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
      postalZipCodeLabel('Postal Code');
    } else if (option.value.code.toString().trim().toLowerCase() == 'us') {
      postalZipCodeLabel('Zip Code');
    } else {
      postalZipCodeLabel('Postal/Zip Code');
    }
   await getCountryStates(option.value.code);
  }

  void onChangedCountryState(option) {
    province(option.value);
    provinceStateController.text = option.value.code;
  }

  Future getCountries() async {
    try {
      propsCountries.useState(UseState.loading);
      CountryRes response = await Get.find<Api>().public.country();
      if (response.data!.isNotEmpty) {
        countries(response.data);
        if (country.value == null && countries.isEmpty) {
          country(countries[0]);
          getCountryStates(countries[0].code!);
        }
        propsCountries.useState(UseState.done);
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      propsCountries.useState(UseState.error);
      propsCountries.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsCountries.useState(UseState.error);
      propsCountries.error(UseError(message: e.toString()));
    } catch (e) {
      propsCountries.useState(UseState.error);
      propsCountries.error(UseError(message: e.toString()));
    }
  }

  Future getCountryStates(String countryCode) async {
    try {
      propsStates.useState(UseState.loading);
      CountryStateReq request = CountryStateReq(countryCode: countryCode);
      CountryStateRes response = await Get.find<Api>().public.states(
            requestData: request.toJson(),
          );
      if (response.data!.isNotEmpty) {
        provinces.clear();
        provinces(response.data);
        propsStates.useState(UseState.done);
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      propsStates.useState(UseState.error);
      propsStates.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsStates.useState(UseState.error);
      propsStates.error(UseError(message: e.toString()));
    } catch (e) {
      propsStates.useState(UseState.error);
      propsStates.error(UseError(message: e.toString()));
    }
  }

  Future create(
    Map<String, dynamic> requestData,
    void Function(String)? event,
  ) async {
    try {
      props.useState(UseState.processing);
      DonorCreateRes response = await Get.find<Api>().donor.create(
            requestData: requestData,
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
    } on DonorCreateRes catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message.toString()));
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    }
  }
}
