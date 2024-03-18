import 'package:flutter/widgets.dart';

import '/core/app_export.dart';
export 'create.dart';
export 'update.dart';

class MediaCentreController extends GetxController {
  Props props = Props();
  Props propsWidgets = Props();
  Props propsMedia = Props();
  ScrollController? controller = ScrollController();

  RxList<Fields> fields = RxList([]);
  Rx<dynamic> routeValues = Rx(null);

  RxList<WidgetData> widgets = RxList([]);
  RxList<MediaData> media = RxList([]);
  Rx<MediaLinks> links = Rx(MediaLinks());

  Rx<int> page = Rx(1);
  Rx<int> totalPage = Rx(1);

  Rx<int> pageSize = Rx(04);

  Rx<Fields?> by = Rx(null);
  Rx<String> order = Rx("ascending");
  Map<String, String> filter = {};

  MediaReq request = MediaReq(
    page: 1,
    pageSize: 04,
    order: "ascending".orderBy,
    by: "url",
  );

  @override
  void onReady() {
    super.onReady();
    props.useState(UseState.loading);
    Future.wait([
      getListOfValues(),
      getRouteName(),
    ]).then((value) async {
      props.useState(UseState.done);
      await getWidgets();
      await getMedia();
    }).catchError((onError) {
      props.useState(UseState.done);
    });
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
    } on RouteLovRes catch (e) {
      props.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      props.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      props.error(UseError(message: e.toString()));
    } catch (e) {
      props.error(UseError(message: e.toString()));
    }
  }

  Future<void> getListOfValues() async {
    try {
      ListOfValuesReq request = ListOfValuesReq(listName: 'mediaFilter');
      ListOfValuesRes response = await Get.find<Api>().messages.lov(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        fields.addAll(reorderList(response.data!));
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

  Future<void> getWidgets() async {
    try {
      propsWidgets.useState(UseState.loading);
      WidgetRes response = await Get.find<Api>().media.widget();
      if (response.result == true) {
        widgets.value = response.data!;
        propsWidgets.useState(UseState.done);
      } else {
        throw response;
      }
    } on WidgetRes catch (e) {
      propsWidgets.useState(UseState.done);
      propsWidgets.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsWidgets.useState(UseState.done);
      propsWidgets.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsWidgets.useState(UseState.done);
      propsWidgets.error(UseError(message: e.toString()));
    } catch (e) {
      propsWidgets.useState(UseState.done);
      propsWidgets.error(UseError(message: e.toString()));
    }
  }

  Future<void> getMedia() async {
    try {
      filter.clear();
      propsMedia.useState(UseState.loading);

      for (var field in fields) {
        if (field.selected!.isTrue) {
          if (field.data != null) filter[field.value!] = field.data.toString();
        }
      }

      MediaRes response = await Get.find<Api>()
          .media
          .media(requestData: request.toJson(filter: filter));
      if (response.result == true) {
        media(response.data);
        links.value = response.links!;
        page(response.links?.currentPage?.toInt());
        pageSize(response.links!.perPage?.toInt());
        totalPage(response.links?.lastPage?.toInt());
        propsMedia.useState(UseState.done);
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      propsMedia.error(UseError(message: e.message));
      propsMedia.useState(UseState.done);
    } on NoInternetException catch (e) {
      propsMedia.error(UseError(message: e.toString()));
      propsMedia.useState(UseState.done);
    } catch (e) {
      propsMedia.error(UseError(message: e.toString()));
      propsMedia.useState(UseState.done);
    }
  }

  Future<void> delete(num? tagNumber) async {
    try {
      propsMedia.useState(UseState.deleting);
      MediaDeleteRes response =
          await Get.find<Api>().media.delete(tagNumber: tagNumber);
      if (response.result == true) {
        propsWidgets.useState(UseState.done);
        Get.back();
        Toasts.success(message: response.message.toString());
        await getMedia();
      } else {
        throw response;
      }
    } on MediaDeleteRes catch (e) {
      propsMedia.useState(UseState.done);
      Toasts.warning(message: e.message.toString());
    } on DioResponse catch (e) {
      propsMedia.useState(UseState.done);
      Toasts.warning(message: e.message.toString());
    } on NoInternetException catch (e) {
      propsMedia.useState(UseState.done);
      Toasts.warning(message: e.toString());
    } catch (e) {
      propsMedia.useState(UseState.done);
      Toasts.error(message: e.toString());
    }
  }

  Future<void> updateWidget({
    num? tagNumber,
    bool? status,
    String? widgetValue,
    required void Function(String? message) callback,
  }) async {
    try {
      WidgetUpdateReq request =
          WidgetUpdateReq(status: status, widgetValue: widgetValue);
      WidgetUpdateRes response = await Get.find<Api>().media.updateWidget(
            tagNumber: tagNumber,
            requestData: request.toJson(),
          );
      if (response.result == true) {
        callback(response.message);
      } else {
        throw response;
      }
    } on WidgetUpdateRes catch (e) {
      propsMedia.useState(UseState.done);
      Toasts.warning(message: e.message.toString());
    } on DioResponse catch (e) {
      propsMedia.useState(UseState.done);
      Toasts.warning(message: e.message.toString());
    } on NoInternetException catch (e) {
      propsMedia.useState(UseState.done);
      Toasts.warning(message: e.toString());
    } catch (e) {
      propsMedia.useState(UseState.done);
      Toasts.error(message: e.toString());
    }
  }

  Future<void> tryAgain() async {
    props.useState(UseState.loading);
    props.error(UseError(message: null));
    Future.wait([
      getListOfValues(),
      getRouteName(),
      getMedia(),
      getWidgets(),
    ]).then((value) {
      props.useState(UseState.done);
    }).catchError((error) {
      props.useState(UseState.done);
    });
  }

  Future<void> tryAgainWidgets() async {
    propsWidgets.useState(UseState.loading);
    propsWidgets.error(UseError(message: null));
    Future.wait([
      getWidgets(),
      getListOfValues(),
      getRouteName(),
    ]).then((value) {
      propsWidgets.useState(UseState.done);
    }).catchError((error) {
      propsWidgets.useState(UseState.done);
    });
  }

  Future<void> tryAgainMedia() async {
    propsMedia.useState(UseState.loading);
    propsMedia.error(UseError(message: null));
    Future.wait([
      getMedia(),
      getListOfValues(),
      getRouteName(),
    ]).then((value) {
      propsMedia.useState(UseState.done);
    }).catchError((error) {
      propsMedia.useState(UseState.done);
    });
  }

  Future<void> reset() async {
    page.value = 1;
    pageSize.value = 04;
    request.page = 1;
    request.pageSize = 04;
    request.by = "url";
    request.order = "ascending".orderBy;
    by.value = null;
    order.value = "ascending";
    filter.clear();
    for (Fields field in fields) {
      if (field.selected!.isTrue) {
        field.selected!(false);
        field.data = null;
      }
    }
    await getWidgets();
  }

  Future<void> onPressedFilter() async {
    request.page = 1;
    Get.back();
    await getMedia();
  }

  Future<void> reloadData() async {
    await getMedia();
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

  Future onPageChanged(p) async {
    page(p);
    request.page = page.value;
    await getMedia();
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
