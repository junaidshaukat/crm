import 'dart:typed_data';

import 'package:flutter/material.dart';

import '/core/app_export.dart';
export 'card.dart';
export 'confirm.dart';
export 'new.dart';

class TransactionsController extends GetxController {
  Props props = Props();
  EnvConfig env = EnvConfig();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxInt selectedchannel = RxInt(0);
  RxList<Transaction> transactions = RxList([]);
  Rx<String> currencySymbol = Rx("");
  Rx<TransactionLinks> links = Rx(TransactionLinks());

  RxList<Fields> fields = RxList([]);
  Rx<Map<String, dynamic>> routeValues = Rx({});

  Rx<int> page = Rx(1);
  Rx<int> totalPage = Rx(1);

  Rx<int> pageSize = Rx(20);

  Rx<Fields?> by = Rx(null);
  Rx<Fields?> by2 = Rx(null);

  Rx<String> order = Rx("descending");

  Map<String, String> filter = {};
  Map<String, List> query = {};

  TransactionsReq request = TransactionsReq(
    page: 1,
    pageSize: 20,
    order: "descending".toString().orderBy,
    by: "transaction_tag",
  );

  TextEditingController email = TextEditingController();

  @override
  void onReady() async {
    await Future.wait([
      getListOfValues(),
      getRouteName(),
      getTransactions(),
    ]);

    super.onReady();
  }

  Future<void> getRouteName() async {
    try {
      RouteLovReq request = RouteLovReq(routeName: 'transaction');
      RouteLovRes response = await Get.find<Api>().messages.routeLov(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        routeValues.value = response.data;
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
      ListOfValuesReq request = ListOfValuesReq(listName: 'transactionFilter');
      ListOfValuesRes response = await Get.find<Api>().messages.lov(
            requestData: request.toJson(),
          );
      if (response.result == true) {
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

  Future<void> getTransactions() async {
    try {
      props.useState(UseState.loading);
      TransactionsRes response = await Get.find<Api>().transactions.read(
            requestData: request.toJson(filter: filter, query: query),
          );
      if (response.result == true) {
        transactions(response.data!.transactions);
        currencySymbol(response.data!.currencySymbol);
        links.value = response.links!;
        page(response.links?.currentPage?.toInt());
        pageSize(response.links!.perPage?.toInt());
        totalPage(response.links?.lastPage?.toInt());
        props.useState(UseState.done);
      } else {
        throw response;
      }
    } on TransactionsRes catch (e) {
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

  Future<void> sendInvoice({int? tagNumber}) async {
    try {
      SendInvoiceReq requestData = SendInvoiceReq(tagNumber: tagNumber);
      SendInvoiceRes response = await Get.find<Api>().transactions.sendInvoice(
            requestData: requestData.toJson(),
          );
      if (response.result == true) {
        Toasts.success(message: response.message);
      } else {
        throw response;
      }
    } on SendInvoiceRes catch (e) {
      Toasts.error(message: e.message);
    } on DioResponse catch (e) {
      Toasts.error(message: e.message);
    } on NoInternetException catch (e) {
      Toasts.error(message: e.toString());
    } catch (e) {
      Toasts.error(message: e.toString());
    }
  }

  Future<void> save(Uint8List data, String fileName, String mimeType) async {
    console.log({"fileName": fileName, "mimeType": mimeType}, name: 'save');
    await DocumentFileSavePlus().saveFile(data, fileName, mimeType);
    Toasts.success(message: "transaction_export".tr);
  }

  String extractFilename(String contentDisposition) {
    final regex = RegExp('filename=(["\']?)([\\w\\d_\\.\\-\\(\\)]+)(\\1)');
    final match = regex.firstMatch(contentDisposition);
    if (match != null) {
      return match.group(2)!;
    }
    return '';
  }

  Future<void> download() async {
    try {
      props.useState(UseState.downloading);
      TransactionExportRes response =
          await Get.find<Api>().transactions.download(
                requestData: request.toJson(filter: filter, query: query),
              );
      if (response.result == true) {
        props.useState(UseState.done);
        await save(response.data!, extractFilename(response.fileName!),
            response.mimeType!);
      } else {
        throw response;
      }
    } on TransactionExportRes catch (e) {
      props.useState(UseState.done);
      Toasts.error(message: e.message.toString());
    } on DioResponse catch (e) {
      props.useState(UseState.done);
      Toasts.error(message: e.message.toString());
    } on NoInternetException catch (e) {
      props.useState(UseState.done);
      Toasts.error(message: e.toString());
    } catch (e) {
      props.useState(UseState.done);
      Toasts.error(message: e.toString());
    }
  }

  Future<void> updateEmail({
    int? tagNumber,
    String? email,
    required void Function() callback,
  }) async {
    try {
      UpdateEmailReq requestData = UpdateEmailReq(
        tagNumber: tagNumber,
        email: email,
      );
      UpdateEmailRes response = await Get.find<Api>().transactions.updateEmail(
            requestData: requestData.toJson(),
          );
      if (response.result == true) {
        callback();
        Get.back();
        Toasts.success(message: response.message);
      } else {
        throw response;
      }
    } on UpdateEmailRes catch (e) {
      Toasts.error(message: e.message);
    } on DioResponse catch (e) {
      Toasts.error(message: e.message);
    } on NoInternetException catch (e) {
      Toasts.error(message: e.toString());
    } catch (e) {
      Toasts.error(message: e.toString());
    }
  }

  Future<void> tryAgain() async {
    props.error(UseError(message: null));
    await getTransactions();
  }

  Future<void> reloadData() async {
    await getTransactions();
  }

  Future onChangedPageSize(DropDown? option) async {
    pageSize(option?.value);
    page(1);
    await getTransactions();
  }

  Future onPageChanged(p) async {
    page(p);
    request.page = page.value;
    await getTransactions();
  }

  Future<void> onPressedFilter() async {
    Get.back();
    page.value = 1;
    request.page = 1;
    filter.clear();
    request.by = by2.value?.value;
    request.pageSize = pageSize.value;
    request.order = order.value.orderBy;

    for (var field in fields) {
      if (field.selected!.isTrue) {
        if (field.data != null) filter[field.value!] = field.data.toString();
      }
    }

    await getTransactions();
  }

  Future<void> reset() async {
    page.value = 1;
    pageSize.value = 20;
    order.value = "ascending";
    by.value = Fields(value: 'payment_processor');

    filter.clear();
    query.clear();

    for (Fields field in fields) {
      if (field.selected!.isTrue) {
        field.selected!(false);
        field.data = null;
      }
    }

    Get.back();

    request.by = "payment_processor";
    request.order = "ascending".toString().orderBy;
    request.page = 1;
    request.pageSize = 20;

    await getTransactions();
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
}
