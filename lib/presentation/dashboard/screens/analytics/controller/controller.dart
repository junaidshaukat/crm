import 'package:flutter/material.dart';
import '/core/app_export.dart';

class AnalyticsController extends GetxController {
  Rx<int> initialPage = Rx(0);
  PageController pageController = PageController(initialPage: 0);

  Props props = Props();

  Rx<num> numberOfYears = Rx(5);
  Props propsYearOverYear = Props();
  Rx<YearOverYear> yearOverYear = Rx(YearOverYear());

  Rx<String> year = Rx(DateTime.now().year.toString());
  Props propsTenderTypes = Props();
  Rx<TenderTypes> tenderTypes = Rx(TenderTypes());

  Rx<String?> month = Rx(null);
  Props propsChannelTypes = Props();
  Rx<ChannelTypes> channelTypes = Rx(ChannelTypes());

  Props propsReceipted = Props();
  Rx<Receipted> receipted = Rx(Receipted());

  @override
  void onReady() async {
    super.onReady();
    await ready();
  }

  Future ready() async {
    await Future.wait([
      getYearOverYears(),
      getTenderTypes(),
      getChannelTypes(),
      getReceipted(),
    ]);
  }

  Future getYearOverYears() async {
    try {
      propsYearOverYear.useState(UseState.loading);
      YearOverYearReq request = YearOverYearReq(
        numberOfYears: numberOfYears.value,
      );
      YearOverYearRes response = await Get.find<Api>().analytics.yearOverYears(
            requestData: request.toJson(),
          );

      if (response.result == true) {
        yearOverYear(response.data);
        propsYearOverYear.useState(UseState.done);
      } else {
        throw response;
      }
    } on TenderTypesRes catch (e) {
      propsYearOverYear.useState(UseState.error);
      propsYearOverYear.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsYearOverYear.useState(UseState.error);
      propsYearOverYear.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsYearOverYear.useState(UseState.error);
      propsYearOverYear.error(UseError(message: e.toString()));
    } catch (e) {
      propsYearOverYear.useState(UseState.error);
      propsYearOverYear.error(UseError(message: e.toString()));
    }
  }

  Future setYearOverYears() async {
    Get.back();
    await getYearOverYears();
  }

  Future getTenderTypes() async {
    try {
      propsTenderTypes.useState(UseState.loading);
      TenderTypesReq request = TenderTypesReq(
        year: year.value,
      );

      TenderTypesRes response = await Get.find<Api>().analytics.tenderTypes(
            requestData: request.toJson(),
          );

      if (response.result == true) {
        tenderTypes(response.data);
        propsTenderTypes.useState(UseState.done);
      } else {
        throw response;
      }
    } on TenderTypesRes catch (e) {
      propsTenderTypes.useState(UseState.error);
      propsTenderTypes.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsTenderTypes.useState(UseState.error);
      propsTenderTypes.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsTenderTypes.useState(UseState.error);
      propsTenderTypes.error(UseError(message: e.toString()));
    } catch (e) {
      propsTenderTypes.useState(UseState.error);
      propsTenderTypes.error(UseError(message: e.toString()));
    }
  }

  Future setTenderTypes() async {
    Get.back();
    await getTenderTypes();
  }

  Future getChannelTypes() async {
    try {
      propsChannelTypes.useState(UseState.loading);
      ChannelTypesReq request = ChannelTypesReq(
        year: year.value,
        month: month.value,
      );
      ChannelTypesRes response = await Get.find<Api>().analytics.channelTypes(
            requestData: request.toJson(),
          );

      if (response.result == true) {
        channelTypes(response.data);
        propsChannelTypes.useState(UseState.done);
      } else {
        throw response;
      }
    } on TenderTypesRes catch (e) {
      propsChannelTypes.useState(UseState.error);
      propsChannelTypes.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsChannelTypes.useState(UseState.error);
      propsChannelTypes.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsChannelTypes.useState(UseState.error);
      propsChannelTypes.error(UseError(message: e.toString()));
    } catch (e) {
      propsChannelTypes.useState(UseState.error);
      propsChannelTypes.error(UseError(message: e.toString()));
    }
  }

  Future setChannelTypes() async {
    Get.back();
    await getChannelTypes();
  }

  Future getReceipted() async {
    try {
      propsReceipted.useState(UseState.loading);
      ReceiptedReq request = ReceiptedReq(
        year: year.value,
      );
      ReceiptedRes response = await Get.find<Api>().analytics.receipted(
            requestData: request.toJson(),
          );

      if (response.result == true) {
        receipted(response.data);
        propsReceipted.useState(UseState.done);
      } else {
        throw response;
      }
    } on TenderTypesRes catch (e) {
      propsReceipted.useState(UseState.error);
      propsReceipted.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsReceipted.useState(UseState.error);
      propsReceipted.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsReceipted.useState(UseState.error);
      propsReceipted.error(UseError(message: e.toString()));
    } catch (e) {
      propsReceipted.useState(UseState.error);
      propsReceipted.error(UseError(message: e.toString()));
    }
  }

  Future setReceipted() async {
    Get.back();
    await getReceipted();
  }
}
