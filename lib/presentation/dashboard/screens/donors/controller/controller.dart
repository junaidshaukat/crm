import 'package:flutter/widgets.dart';
import '/core/app_export.dart';

export 'create.dart';
export 'update.dart';

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

  RxList<DonorData> donors = <DonorData>[].obs;
  Rx<DonorLinks> links = Rx(DonorLinks());
  RxList<Fields> fields = RxList([]);

  Rx<int> page = Rx(1);
  Rx<int> totalPage = Rx(1);

  Rx<int> pageSize = Rx(10);

  Rx<Fields?> by = Rx(null);
  Rx<String> order = Rx("ascending");

  Map<String, String> filter = {};

  @override
  void onInit() async {
    super.onInit();
    await getListOfValues();
    await getDonors();
  }

  Future getListOfValues() async {
    try {
      ListOfValuesReq request = ListOfValuesReq(listName: 'donorFilter');
      ListOfValuesRes response = await Get.find<Api>().messages.lov(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        for (var element in response.data!) {
          fields.add(Fields(
            value: element.value,
            label: element.label,
            control: element.control,
            selected: false.obs,
          ));
        }
        return response;
      } else {
        throw response;
      }
    } on ListOfValuesRes catch (e) {
      props.error(UseError(message: e.message));
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
            requestData: request.toJson(filter: filter),
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

  Future<void> tryAgain() async {
    props.useState(UseState.loading);
    props.error(UseError(message: null));
    await getListOfValues();
    await getDonors();
  }

  Future<void> reloadData() async {
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

  Future<void> onPressedFilter() async {
    Get.back();
    page.value = 1;
    await getDonors();
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

  Future<void> reset() async {
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
    await getDonors();
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
        console.log({field.value, val});
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
}
