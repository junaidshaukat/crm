import '/core/app_export.dart';

class EcheckMenu {
  num value;
  String label;
  num percentage;
  RxBool selected;
  String description;
  String statusImage;
  String filteredFlag;

  EcheckMenu({
    required this.value,
    required this.label,
    required this.selected,
    required this.percentage,
    required this.description,
    required this.statusImage,
    required this.filteredFlag,
  });
}

class EcheckController extends GetxController {
  Props propsEcheckSummary = Props();
  Props propsRouteName = Props();
  Props propsEcheckPayment = Props();
  Props propsChannelDetails = Props();

  RxList<EcheckMenu> echeckSummary = RxList([]);

  RxInt selectedchannel = RxInt(0);

  RxList<EcheckPaymentData> echeckPayment = RxList([]);
  RxList<ChannelDetails> channelDetails = RxList([]);
  Rx<EcheckPaymentLinks> links = Rx(EcheckPaymentLinks());

  RxList<Fields> fields = RxList([]);
  Rx<dynamic> routeValues = Rx(null);

  Rx<int> page = Rx(1);
  Rx<int> totalPage = Rx(1);

  Rx<int> pageSize = Rx(10);

  Rx<Fields?> by = Rx(null);
  Rx<Fields?> by2 = Rx(null);

  Rx<String> order = Rx("ascending");

  Map<String, String> filter = {};
  Map<String, List> query = {};

  EcheckPaymentReq request = EcheckPaymentReq(
    page: 1,
    by: "email",
    pageSize: 10,
    order: "ascending".toString().orderBy,
  );

  Rx<num?> tagNumber = Rx(null);

  Rx<String?> year = Rx(null);
  Rx<String?> month = Rx(null);
  Rx<String?> day = Rx(null);

  @override
  void onReady() async {
    await Future.wait([
      getListOfValues(),
      getRouteName(),
      getEcheckSummary(),
      getEcheckPayment(),
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
      propsRouteName.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsRouteName.error(UseError(message: e.toString()));
    } catch (e) {
      propsRouteName.error(UseError(message: e.toString()));
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
      ListOfValuesReq request =
          ListOfValuesReq(listName: 'eCheckScheduleFilter');
      ListOfValuesRes response = await Get.find<Api>().messages.lov(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        fields.addAll(reorderList(response.data!));
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      propsRouteName.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsRouteName.error(UseError(message: e.toString()));
    } catch (e) {
      propsRouteName.error(UseError(message: e.toString()));
    }
  }

  Future<void> getEcheckSummary() async {
    try {
      propsEcheckSummary.useState(UseState.loading);
      EcheckSummaryRes response = await Get.find<Api>().echeck.echeckSummary();
      if (response.result == true) {
        List<EcheckSummaryData>? data = response.data;
        for (var element in data!) {
          echeckSummary.add(EcheckMenu(
            selected: false.obs,
            label: element.label,
            value: element.value,
            percentage: element.percentage,
            statusImage: element.statusImage,
            description: element.description,
            filteredFlag: element.filteredFlag,
          ));
        }
        propsEcheckSummary.useState(UseState.done);
      } else {
        throw response;
      }
    } on ChannelSummaryRes catch (e) {
      propsEcheckSummary.useState(UseState.none);
      propsEcheckSummary.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsEcheckSummary.useState(UseState.none);
      propsEcheckSummary.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsEcheckSummary.useState(UseState.none);
      propsEcheckSummary.error(UseError(message: e.toString()));
    } catch (e) {
      propsEcheckSummary.useState(UseState.none);
      propsEcheckSummary.error(UseError(message: e.toString()));
    }
  }

  Future<void> getEcheckPayment() async {
    try {
      propsEcheckPayment.useState(UseState.loading);

      EcheckPaymentRes response = await Get.find<Api>().echeck.echeckPayment(
            requestData: request.toJson(filter: filter, query: query),
          );
      if (response.result == true) {
        echeckPayment.value = response.data!;
        links.value = response.links!;

        page(response.links?.currentPage?.toInt());
        pageSize(response.links?.perPage?.toInt());
        totalPage(response.links?.lastPage?.toInt());

        propsEcheckPayment.useState(UseState.done);
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      propsEcheckPayment.useState(UseState.done);
      propsEcheckPayment.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsEcheckPayment.useState(UseState.done);
      propsEcheckPayment.error(UseError(message: e.toString()));
    } catch (e) {
      propsEcheckPayment.useState(UseState.done);
      propsEcheckPayment.error(UseError(message: e.toString()));
    }
  }

  Future<void> tryAgain() async {
    propsEcheckPayment.error(UseError(message: null));
    await getEcheckPayment();
  }

  Future<void> reloadData() async {
    await getEcheckPayment();
  }

  Future<void> selectChannel(EcheckMenu summary) async {
    filter.clear();
    query.clear();

    for (Fields field in fields) {
      if (field.selected!.isTrue) {
        field.selected!(false);
        field.data = null;
      }
    }

    for (var element in echeckSummary) {
      if (element.label == summary.label) {
        page.value = 1;
        pageSize.value = 10;
        order.value = "ascending";

        request.by = "schedule_status";
        request.scheduleStatus = element.filteredFlag;

        by.value = Fields(value: "type", label: element.filteredFlag);
        element.selected.value = true;
      } else {
        element.selected.value = false;
      }
    }
    await getEcheckPayment();
  }

  Future onPageChanged(p) async {
    page(p);
    await getEcheckPayment();
  }

  Future<void> onPressedFilter() async {
    Get.back();
    page.value = 1;
    filter.clear();
    request.by = by2.value?.value;
    request.type = null;
    request.pageSize = pageSize.value;
    request.scheduleStatus = null;

    for (var element in echeckSummary) {
      element.selected.value = false;
    }

    for (var field in fields) {
      if (field.selected!.isTrue) {
        if (field.data != null) filter[field.value!] = field.data.toString();
      }
    }

    await getEcheckPayment();
  }

  Future<void> reset() async {
    page.value = 1;
    pageSize.value = 10;
    order.value = "ascending";
    by.value = Fields(value: 'email');
    by2.value = Fields(value: 'email');

    filter.clear();
    query.clear();

    for (Fields field in fields) {
      if (field.selected!.isTrue) {
        field.selected!(false);
        field.data = null;
      }
    }

    for (var element in echeckSummary) {
      element.selected.value = false;
    }

    Get.back();

    request.by = "email";
    request.order = "ascending".toString().orderBy;
    request.page = 1;
    request.pageSize = 10;
    request.type = null;

    await getEcheckPayment();
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
