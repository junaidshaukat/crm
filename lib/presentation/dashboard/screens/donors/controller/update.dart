import 'package:flutter/material.dart';
import '/core/app_export.dart';

class UpdateDonorsController extends GetxController {
  Props props = Props();

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

  Future<void> setTextEditingController(DonorData donor) async {
    firstNameController.text = donor.firstName ?? '';
    middleInitialsController.text = donor.middleName ?? '';
    lastNameController.text = donor.lastName ?? '';
    phoneController.text = donor.phone ?? '';
    emailController.text = donor.email ?? '';
    passwordController.text = donor.accountPassword ?? '';
    streetAddressController.text = donor.streetAddress ?? '';
    cityController.text = donor.city ?? '';
    countryController.text = donor.country ?? '';
    provinceStateController.text = donor.provinceState ?? '';
    postalZipCodeController.text = donor.postalZipCode ?? '';
    await getCountries(donor.country);
    await getCountryStates(country.value!.code!,
        provinceState: donor.provinceState);
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

        if (country.value == null) {
          country.value = response.data?.first;
          countryController.text = country.value!.name!;
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
      console.log({countryCode, provinceState}, name: 'getCountryStates');
      CountryStateReq request = CountryStateReq(countryCode: countryCode);
      CountryStateRes response = await Get.find<Api>().public.states(
            requestData: request.toJson(),
          );
      if (response.data!.isNotEmpty) {
        provinces.clear();
        provinces(response.data);
        for (var element in response.data!) {
          console.log({countryCode, provinceState, element.toJson()},
              name: 'provinceState');

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

  // Future getCountries() async {
  //   try {
  //     propsCountries.useState(UseState.loading);
  //     CountryRes response = await Get.find<Api>().public.country();
  //     if (response.data!.isNotEmpty) {
  //       countries(response.data);
  //       propsCountries.useState(UseState.done);
  //     } else {
  //       throw response;
  //     }
  //   } on DioResponse catch (e) {
  //     propsCountries.useState(UseState.error);
  //     propsCountries.error(UseError(message: e.message));
  //   } on NoInternetException catch (e) {
  //     propsCountries.useState(UseState.error);
  //     propsCountries.error(UseError(message: e.toString()));
  //   } catch (e) {
  //     propsCountries.useState(UseState.error);
  //     propsCountries.error(UseError(message: e.toString()));
  //   }
  // }

  // Future getCountryStates(String countryCode) async {
  //   try {
  //     propsStates.useState(UseState.loading);
  //     CountryStateReq request = CountryStateReq(countryCode: countryCode);
  //     CountryStateRes response = await Get.find<Api>().public.states(
  //           requestData: request.toJson(),
  //         );
  //     if (response.data!.isNotEmpty) {
  //       provinces.clear();
  //       provinces(response.data);
  //       propsStates.useState(UseState.done);
  //     } else {
  //       throw response;
  //     }
  //   } on DioResponse catch (e) {
  //     propsStates.useState(UseState.error);
  //     propsStates.error(UseError(message: e.message));
  //   } on NoInternetException catch (e) {
  //     propsStates.useState(UseState.error);
  //     propsStates.error(UseError(message: e.toString()));
  //   } catch (e) {
  //     propsStates.useState(UseState.error);
  //     propsStates.error(UseError(message: e.toString()));
  //   }
  // }

  Future updateDonor(
    String? tagNumber,
    Map<String, dynamic> requestData, {
    void Function(dynamic)? event,
  }) async {
    try {
      props.useState(UseState.processing);
      DonorUpdateRes response = await Get.find<Api>().donor.update(
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
