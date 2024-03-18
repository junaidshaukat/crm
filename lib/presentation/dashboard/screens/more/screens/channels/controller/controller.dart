import 'package:flutter/material.dart';

import '/core/app_export.dart';

class ChennelMenu {
  String label;
  String filteredFlag;
  num value;
  String image;
  RxBool selected;

  ChennelMenu({
    required this.label,
    required this.filteredFlag,
    required this.value,
    required this.image,
    required this.selected,
  });
}

class ChannelsController extends GetxController {
  Props propsChannelSummary = Props();
  Props propsRegisteredChannels = Props();
  Props propsUpdateChannel = Props();

  RxList<ChennelMenu> channelSummary = RxList([]);

  TextEditingController channelName = TextEditingController();

  RxInt selectedchannel = RxInt(0);

  RxList<ChannelsData> channels = RxList([]);
  Rx<ChannelsLinks> links = Rx(ChannelsLinks());

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

  ChannelsReq request = ChannelsReq(
    page: 1,
    pageSize: 10,
    order: "ascending".toString().orderBy,
    by: "payment_processor",
  );

  @override
  void onReady() async {
    await Future.wait([
      getListOfValues(),
      getRouteName(),
      getChannelSummary(),
      getChannels(),
    ]);

    super.onReady();
  }

  Future<void> getRouteName() async {
    try {
      RouteLovReq request = RouteLovReq(routeName: 'channel');
      RouteLovRes response = await Get.find<Api>().messages.routeLov(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        routeValues.value = response.data;
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      propsRegisteredChannels.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsRegisteredChannels.error(UseError(message: e.toString()));
    } catch (e) {
      propsRegisteredChannels.error(UseError(message: e.toString()));
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
      ListOfValuesReq request = ListOfValuesReq(listName: 'channelFilter');
      ListOfValuesRes response = await Get.find<Api>().messages.lov(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        fields.addAll(reorderList(response.data!));
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      propsRegisteredChannels.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsRegisteredChannels.error(UseError(message: e.toString()));
    } catch (e) {
      propsRegisteredChannels.error(UseError(message: e.toString()));
    }
  }

  Future<void> getChannelSummary() async {
    try {
      propsChannelSummary.useState(UseState.loading);
      ChannelSummaryRes response =
          await Get.find<Api>().channels.channelSummary();
      if (response.result == true) {
        List<ChannelSummaryData>? data = response.data;
        for (var element in data!) {
          channelSummary.add(ChennelMenu(
            label: element.label,
            filteredFlag: element.filteredFlag,
            image: element.image,
            value: element.value,
            selected: false.obs,
          ));
        }
        propsChannelSummary.useState(UseState.done);
      } else {
        throw response;
      }
    } on ChannelSummaryRes catch (e) {
      propsChannelSummary.useState(UseState.none);
      propsChannelSummary.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsChannelSummary.useState(UseState.none);
      propsChannelSummary.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsChannelSummary.useState(UseState.none);
      propsChannelSummary.error(UseError(message: e.toString()));
    } catch (e) {
      propsChannelSummary.useState(UseState.none);
      propsChannelSummary.error(UseError(message: e.toString()));
    }
  }

  Future<void> getChannels() async {
    try {
      //  filter.clear();
      propsRegisteredChannels.useState(UseState.loading);

      // for (var field in fields) {
      //   if (field.selected!.isTrue) {
      //     if (field.data != null) filter[field.value!] = field.data.toString();
      //   }
      // }

      ChannelsRes response = await Get.find<Api>().channels.channel(
            requestData: request.toJson(filter: filter, query: query),
          );
      if (response.result == true) {
        channels.value = response.data!;
        links.value = response.links!;

        page(response.links?.currentPage?.toInt());
        pageSize(response.links?.perPage?.toInt());
        totalPage(response.links?.lastPage?.toInt());

        propsRegisteredChannels.useState(UseState.done);
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      propsRegisteredChannels.useState(UseState.done);
      propsRegisteredChannels.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsRegisteredChannels.useState(UseState.done);
      propsRegisteredChannels.error(UseError(message: e.toString()));
    } catch (e) {
      propsRegisteredChannels.useState(UseState.done);
      propsRegisteredChannels.error(UseError(message: e.toString()));
    }
  }

  Future updateChannelName(
    num? tagNumber,
    Map<String, dynamic> requestData, {
    void Function(dynamic)? event,
  }) async {
    try {
      propsUpdateChannel.useState(UseState.processing);
      ChannelUpdateRes response =
          await Get.find<Api>().channels.updateChannelName(
                requestData: requestData,
                tagNumber: tagNumber,
              );

      if (response.result == true) {
        propsUpdateChannel.useState(UseState.none);
        event!("update");
        Get.back();
        Toasts.success(
          message: response.message.toString(),
        );
      } else {
        throw response;
      }
    } on DonorUpdateRes catch (e) {
      propsUpdateChannel.useState(UseState.none);
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      propsUpdateChannel.useState(UseState.none);
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      propsUpdateChannel.useState(UseState.none);
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      propsUpdateChannel.useState(UseState.none);
      Toasts.error(
        message: e.toString(),
      );
    }
  }

  Future<void> tryAgain() async {
    propsRegisteredChannels.error(UseError(message: null));
    await getChannels();
  }

  Future<void> reloadData() async {
    await getChannels();
  }

  Future<void> selectChannel(ChennelMenu summary) async {
    filter.clear();
    query.clear();

    for (Fields field in fields) {
      if (field.selected!.isTrue) {
        field.selected!(false);
        field.data = null;
      }
    }

    for (var element in channelSummary) {
      if (element.label == summary.label) {
        page.value = 1;
        pageSize.value = 10;
        order.value = "ascending";

        request.by = "type";
        request.type = element.filteredFlag;

        by.value = Fields(value: "type", label: element.filteredFlag);
        element.selected.value = true;
      } else {
        element.selected.value = false;
      }
    }
    await getChannels();
  }

  Future onChangedPageSize(DropDown? option) async {
    pageSize(option?.value);
    page(1);
    await getChannels();
  }

  Future onPageChanged(p) async {
    page(p);
    await getChannels();
  }

  Future<void> onPressedFilter() async {
    Get.back();
    page.value = 1;
    filter.clear();
    request.by = by2.value?.value;
    request.type = null;

    for (var element in channelSummary) {
      element.selected.value = false;
    }

    for (var field in fields) {
      if (field.selected!.isTrue) {
        if (field.data != null) filter[field.value!] = field.data.toString();
      }
    }

    await getChannels();
  }

  Future<void> reset() async {
    page.value = 1;
    pageSize.value = 10;
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

    for (var element in channelSummary) {
      element.selected.value = false;
    }

    Get.back();

    request.by = "payment_processor";
    request.order = "ascending".toString().orderBy;
    request.page = 1;
    request.pageSize = 10;
    request.type = null;

    await getChannels();
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
