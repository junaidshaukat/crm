import 'dart:io';

import 'package:flutter/widgets.dart';
import '/core/app_export.dart';

export 'create.dart';
export 'update.dart';
export 'details.dart';

class Fields {
  String? value;
  String? label;
  String? control;
  dynamic data;
  Rx<bool>? selected;

  Fields({
    this.value,
    this.label,
    this.control,
    this.data,
    this.selected,
  });
}

class FieldController {
  TextEditingController controller;
  bool enabled;

  FieldController({
    required this.controller,
    this.enabled = false,
  });
}

class DonorsController extends GetxController {
  Props props = Props();
  Props propsProfile = Props();

  RxList<DonorData> donors = <DonorData>[].obs;
  Rx<DonorLinks?> links = Rx(null);
  RxList<Fields> fields = RxList([]);

  Rx<int> page = Rx(1);
  Rx<int> totalPage = Rx(1);

  Rx<int> pageSize = Rx(10);

  Rx<Fields?> by = Rx(null);
  Rx<String> order = Rx("ascending");

  Map<String, String> filter = {};
  Map<String, List> query = {};
  Rx<Map<String, dynamic>> routeValues = Rx({});

  Rx<File?> profileImage = Rx(null);

  Rx<int> selectedIndex = Rx(1);
  Rx<int> tab = Rx(1);

  Rx<double> latitude = Rx(0.0);
  Rx<double> longitude = Rx(0.0);
  Rx<double> radius = Rx(50.0);
  Rx<String> postalZipCode = Rx('');

  TextEditingController radiusController = TextEditingController(text: '50');
  TextEditingController postalZipCodeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();

  @override
  void onInit() async {
    await Future.wait([
      getListOfValues(),
      getRouteName(),
      getDonors(),
    ]);
    super.onInit();
  }

  Future<void> getRouteName() async {
    try {
      RouteLovReq request = RouteLovReq(routeName: 'donor');
      RouteLovRes response = await Get.find<Api>().messages.routeLov(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        routeValues.value.clear();
        Map<String, dynamic> data = response.data as Map<String, dynamic>;

        if (!data.containsKey("account_type")) {
          data.addAll({
            "account_type": [
              {"value": "B", "label": "Business"},
              {"value": "I", "label": "Individual"},
            ]
          });
        }

        routeValues.value = data;
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      props.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      props.error(UseError(message: e.toString()));
    } catch (e) {
      props.error(UseError(message: e.toString()));
    }
  }

  List<Fields> reorderList(List<ListOfValues>? list) {
    List<Fields> textboxItems = [];
    List<Fields> otherItems = [];

    // Separating items based on control value
    for (var item in list!) {
      if (item.control == 'textbox') {
        textboxItems.add(Fields(
          value: item.value,
          label: item.label,
          control: item.control,
          selected: false.obs,
        ));
      } else {
        otherItems.add(Fields(
          value: item.value,
          label: item.label,
          control: item.control,
          selected: false.obs,
        ));
      }
    }

    // Combining the lists with textbox items first
    List<Fields> reorderedList = [];
    reorderedList.addAll(textboxItems);
    reorderedList.addAll(otherItems);

    return reorderedList;
  }

  Future<void> getListOfValues() async {
    try {
      ListOfValuesReq request = ListOfValuesReq(listName: 'donorFilter');
      ListOfValuesRes response = await Get.find<Api>().messages.lov(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        fields.clear();
        fields.addAll(reorderList(response.data!));
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      props.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      props.error(UseError(message: e.toString()));
    } catch (e) {
      props.error(UseError(message: e.toString()));
    }
  }

  Future<void> getDonors() async {
    try {
      props.useState(UseState.loading);
      filter.clear();
      DonorReadReq request = DonorReadReq(
        page: page.value,
        pageSize: pageSize.value,
        order: order.toString().orderBy,
        by: by.value?.value,
      );

      for (var field in fields) {
        if (field.selected!.isTrue) {
          if (field.data != null) filter[field.value!] = field.data.toString();
        }
      }

      DonorReadRes response = await Get.find<Api>().donor.read(
            requestData: request.toJson(filter: filter, query: query),
          );
      if (response.result == true) {
        donors.value = response.data;
        links.value = response.links;
        page(response.links.currentPage?.toInt());
        pageSize(response.links.perPage?.toInt());
        totalPage(response.links.lastPage?.toInt());
        props.useState(UseState.done);
      } else {
        throw response;
      }
    } on DonorReadRes catch (e) {
      props.useState(UseState.done);
      props.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      props.useState(UseState.done);
      props.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      props.useState(UseState.done);
      props.error(UseError(message: e.toString()));
    } catch (e) {
      props.useState(UseState.done);
      props.error(UseError(message: e.toString()));
    }
  }

  Future<void> getDonorsNearest() async {
    try {
      props.useState(UseState.loading);
      filter.clear();
      NearByReq request = NearByReq(
        radius: radius.value,
        latitude: latitude.value,
        longitude: longitude.value,
        postalZipCode: postalZipCode.value,
      );

      NearByRes response = await Get.find<Api>().donor.nearBy(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        donors.value = response.data;
        links.value = null;
        props.useState(UseState.done);
      } else {
        throw response;
      }
    } on NearByRes catch (e) {
      props.useState(UseState.done);
      props.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      props.useState(UseState.done);
      props.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      props.useState(UseState.done);
      props.error(UseError(message: e.toString()));
    } catch (e) {
      props.useState(UseState.done);
      props.error(UseError(message: e.toString()));
    }
  }

  Future<void> tryAgain() async {
    props.useState(UseState.loading);
    props.error(UseError(message: null));
    await getListOfValues();
    await getDonors();
  }

  Future<void> reloadData() async {
    props.error(UseError(message: null));
    await getDonors();
  }

  Future onChangedPageSize(DropDown? option) async {
    pageSize(option?.value);
    page(1);
    await getDonors();
  }

  Future onPageChanged(p) async {
    page(p);
    await getDonors();
  }

  Future<void> onPressedFilter({
    bool byFields = false,
    bool byNearest = false,
  }) async {
    if (byFields) {
      tab.value = 1;
      Get.back();
      page.value = 1;
      await getDonors();
    } else if (byNearest) {
      tab.value = 2;
      Get.back();
      page.value = 1;
      await getDonorsNearest();
    }
  }

  Future<void> updateProfileImage(num? tagNumber, File file) async {
    try {
      propsProfile.useState(UseState.updating);
      FormData requestData = FormData.fromMap({
        'tagNumber': tagNumber,
        'profileImage': await MultipartFile.fromFile(
          file.path,
          filename: file.path.filename,
        ),
      });

      UpdateProfileImageRes response = await Get.find<Api>()
          .donor
          .updateProfileImage(requestData: requestData);

      if (response.result == true) {
        propsProfile.useState(UseState.none);
        Get.back();
        await getDonors();
      } else {
        throw response;
      }
    } on UpdateProfileImageRes catch (e) {
      propsProfile.useState(UseState.none);
      Toasts.error(message: e.message.toString());
    } on DioResponse catch (e) {
      propsProfile.useState(UseState.none);
      Toasts.error(message: e.message.toString());
    } on NoInternetException catch (e) {
      propsProfile.useState(UseState.none);
      Toasts.error(message: e.toString());
    } catch (e) {
      propsProfile.useState(UseState.none);
      Toasts.error(message: e.toString());
    }
  }

  Future<void> deleteProfileImage(num? tagNumber) async {
    try {
      propsProfile.useState(UseState.deleting);
      DeleteProfileImageRes response =
          await Get.find<Api>().donor.deleteProfileImage(
        requestData: {"tagNumber": tagNumber},
      );

      if (response.result == true) {
        propsProfile.useState(UseState.none);
        Get.back();
        await getDonors();
      } else {
        throw response;
      }
    } on DeleteProfileImageRes catch (e) {
      propsProfile.useState(UseState.none);
      Toasts.error(message: e.message.toString());
    } on DioResponse catch (e) {
      propsProfile.useState(UseState.none);
      Toasts.error(message: e.message.toString());
    } on NoInternetException catch (e) {
      propsProfile.useState(UseState.none);
      Toasts.error(message: e.toString());
    } catch (e) {
      propsProfile.useState(UseState.none);
      Toasts.error(message: e.toString());
    }
  }

  Future<void> deleteDonor(num? tagNumber) async {
    try {
      props.useState(UseState.deleting);
      DonorDeleteRes response = await Get.find<Api>().donor.delete(
            id: tagNumber.toString(),
          );
      if (response.result == true) {
        Get.back();
        await getDonors();
      }
    } on DioResponse catch (e) {
      props.useState(UseState.done);
      Get.back();
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      props.useState(UseState.done);
      Get.back();
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      props.useState(UseState.done);
      Get.back();
      Toasts.error(
        message: e.toString(),
      );
    }
  }

  Future<void> reset({
    bool byFields = false,
    bool byNearest = false,
  }) async {
    if (byFields) {
      query.clear();
      tab.value = 1;
      page.value = 1;
      pageSize.value = 10;
      by.value = null;
      order.value = "ascending";
      filter.clear();
      radius.value = 50;
      radiusController.clear();
      radiusController.text = '50';
      for (Fields field in fields) {
        if (field.selected!.isTrue) {
          field.selected!(false);
          field.data = null;
        }
      }
      props.error(UseError(message: null));
      await getDonors();
    }
    if (byNearest) {
      query.clear();
      tab.value = 2;
      radius.value = 50;
      radiusController.clear();
      radiusController.text = '50';
      page.value = 1;
      pageSize.value = 10;
      by.value = null;
      order.value = "ascending";
      filter.clear();
      for (Fields field in fields) {
        if (field.selected!.isTrue) {
          field.selected!(false);
          field.data = null;
        }
      }
      props.error(UseError(message: null));
      await getDonorsNearest();
    }
  }

  List<String> get getDropDownHint {
    List<String> temp = [];
    for (Fields field in fields) {
      if (field.selected!.isTrue) {
        temp.add(field.label!);
      }
    }
    return temp;
  }

  List<Fields> get getFields {
    List<Fields> temp = [];
    for (Fields field in fields) {
      if (field.selected!.isFalse) {
        temp.add(field);
      }
    }
    return temp;
  }

  void selectFields(DropDown? option) {
    for (Fields field in fields) {
      if (field.value == option?.value) {
        field.selected!(true);
      }
    }
  }

  void onChangedField(String val, Fields opt) {
    for (Fields field in fields) {
      if (field.value == opt.value) {
        field.data = val;
      }
    }
  }

  void removeField(Fields option) {
    for (Fields field in fields) {
      if (field.value == option.value) {
        field.selected!(false);
        field.data = null;
      }
    }
  }

  void onChangeLocation(LatLng position) {
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    latitudeController.text = position.latitude.toStringAsFixed(6);
    longitudeController.text = position.longitude.toStringAsFixed(6);
  }
}
