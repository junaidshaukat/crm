import 'dart:typed_data';

import 'package:flutter/material.dart';
import '/core/app_export.dart';

export './create.dart';
export './update.dart';

class CompaignController extends GetxController {
  EnvConfig env = EnvConfig();
  ScrollController scrollControlle = ScrollController();
  Props props = Props();
  Props propsListOfValues = Props();

  Rx<CampaignLink?> links = Rx(CampaignLink());
  RxList<Fields> fields = RxList([]);

  Rx<int> page = Rx(1);
  Rx<int> totalPage = Rx(1);

  Rx<int> pageSize = Rx(10);

  Rx<Fields?> by = Rx(null);
  Rx<String> order = Rx("ascending");
  Map<String, String> filter = {};

  //

  RxList<CampaignData> compaigns = <CampaignData>[].obs;

  @override
  void onReady() async {
    await Future.wait([
      getListOfValues(),
      getCampaigns(),
    ]);
    super.onReady();
  }

  Future<void> getListOfValues() async {
    try {
      propsListOfValues.useState(UseState.loading);

      ListOfValuesReq request = ListOfValuesReq(listName: 'campaignFilter');

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
        propsListOfValues.useState(UseState.done);
      } else {
        propsListOfValues.useState(UseState.done);
      }
    } on ListOfValuesRes catch (e) {
      propsListOfValues.useState(UseState.error);
      propsListOfValues.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsListOfValues.useState(UseState.error);
      propsListOfValues.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsListOfValues.useState(UseState.error);
      propsListOfValues.error(UseError(message: e.toString()));
    } catch (e) {
      propsListOfValues.useState(UseState.error);
      propsListOfValues.error(UseError(message: e.toString()));
    }
  }

  Future getCampaigns() async {
    try {
      props.useState(UseState.loading);
      filter.clear();

      CampaignsReq request = CampaignsReq(
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

      CampaignsRes response = await Get.find<Api>().campaign.read(
            requestData: request.toJson(filter: filter),
          );
      if (response.result == true) {
        compaigns.value = response.data!;
        links.value = response.links;
        page(response.links?.currentPage?.toInt());
        pageSize(response.links?.perPage?.toInt());
        totalPage(response.links?.lastPage?.toInt());

        props.useState(UseState.done);
        return response;
      } else {
        return response;
      }
    } on CampaignsRes catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.toString()));
    } catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.toString()));
    }
  }

  Future<void> tryAgain() async {
    props.useState(UseState.loading);
    props.error(UseError(message: null));
    await getCampaigns();
  }

  Future<void> onDeleteCompaign(num? tagNumber) async {
    try {
      props.useState(UseState.deleting);

      CampaignsRes response = await Get.find<Api>().campaign.delete(
            tagNumber: tagNumber.toString(),
          );
      if (response.result == true) {
        Get.back();
        await getCampaigns();
      }
    } on CampaignsRes catch (e) {
      console.log(e.message, name: 'CampaignsRes');
      props.useState(UseState.done);
      Get.back();
      Toasts.error(
        message: e.message.toString(),
      );
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
    await getCampaigns();
  }

  Future onChangedPageSize(DropDown? option) async {
    pageSize(option?.value);
    page(1);
    await getCampaigns();
  }

  Future onPageChanged(p) async {
    page(p);
    await getCampaigns();
  }

  Future<void> onPressedFilter() async {
    Get.back();
    await getCampaigns();
  }

  Future<void> reloadData() async {
    await getCampaigns();
  }

  String extractFilename(String contentDisposition) {
    final regex = RegExp('filename=(".*")');
    final match = regex.firstMatch(contentDisposition);
    if (match != null) {
      return match.group(1)!.replaceAll('"', '');
    }
    return '';
  }

  Future<void> save(Uint8List data, String fileName, String mimeType) async {
    console.log({fileName, mimeType});
    await DocumentFileSavePlus().saveFile(data, fileName, mimeType);
    Toasts.success(message: "qrcode_saved".tr);
  }

  Future<bool> qrCode(String? qrCode, String? name) async {
    try {
      QrReadReq request = QrReadReq(
        data: qrCode,
        name: name,
      );

      QrReadRes response = await Get.find<Api>().qr.read(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        await save(response.data!, extractFilename(response.fileName!),
            response.mimeType!);
        return true;
      } else {
        return false;
      }
    } on QrReadRes catch (e) {
      Toasts.error(
        message: e.message.toString(),
      );
      return false;
    } on DioResponse catch (e) {
      Toasts.error(
        message: e.message.toString(),
      );
      return false;
    } on NoInternetException catch (e) {
      Toasts.error(
        message: e.toString(),
      );
      return false;
    } catch (e) {
      Toasts.error(
        message: e.toString(),
      );
      return false;
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

  void onChangedField(dynamic val, Fields opt) {
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
      }
    }
  }
}
