import 'package:flutter/material.dart';

import '/core/app_export.dart';

class HomeCompaignsController extends GetxController {
  Rx<int> initialPage = Rx(0);
  PageController pageController = PageController(initialPage: 0);
  Props props = Props();
  Props propsChannels = Props();

  List<String> channelType = [];

  RxList<ChannelType> channelTypes = <ChannelType>[
    // ChannelType(id: 'Kiosk', title: 'Kiosk', isSelectedSwitch: true.obs),
    // ChannelType(id: 'Handheld', title: 'Handheld', isSelectedSwitch: true.obs),
    // ChannelType(id: 'gateway', title: 'Gateway', isSelectedSwitch: true.obs),
    // ChannelType(id: 'Manual', title: 'Manual', isSelectedSwitch: true.obs),
    // ChannelType(id: 'External', title: 'External', isSelectedSwitch: true.obs),
    // ChannelType(id: 'eCheck', title: 'eCheck', isSelectedSwitch: true.obs),
  ].obs;

  Rx<CampaignSummary?> campaigns = Rx(null);
  CampaignSummaryReq request = CampaignSummaryReq();

  Rx<String?> year = Rx(DateTime.now().year.toString());
  Rx<String?> month = Rx(DateTime.now().month.monthName);
  Rx<DateTime?> day = Rx(DateTime.now());

  @override
  void onReady() async {
    super.onReady();
    await ready();
  }

  Future ready() async {
    Future.wait([
      getRouteName(),
      getCampaignSummary(),
    ]);
  }

  List<String> get channels {
    return channelTypes
        .where((e) => e.isSelectedSwitch.isTrue)
        .map((e) => e.value)
        .toList();
  }

  Future<void> getRouteName() async {
    try {
      propsChannels.useState(UseState.loading);
      RouteLovReq request = RouteLovReq(routeName: 'transaction');
      RouteLovRes response = await Get.find<Api>().messages.routeLov(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        for (var node in response.data["node_type"]) {
          channelTypes.add(
            ChannelType(
              id: node['value'],
              label: node['label'],
              value: node['value'],
              isSelectedSwitch: true.obs,
            ),
          );
        }
        propsChannels.useState(UseState.done);
      } else {
        throw response;
      }
    } on RouteLovRes catch (e) {
      propsChannels.useState(UseState.error);
      propsChannels.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsChannels.useState(UseState.done);
      propsChannels.error(UseError(message: e.toString()));
    } on DioResponse catch (e) {
      propsChannels.useState(UseState.done);
      propsChannels.error(UseError(message: e.message));
    } catch (e) {
      propsChannels.useState(UseState.done);
      propsChannels.error(UseError(message: e.toString()));
    }
  }

  Future getCampaignSummary({String endpoint = "channelType"}) async {
    try {
      props.useState(UseState.loading);
      if (endpoint == 'channelType') {
        CampaignSummaryRes response =
            await Get.find<Api>().dashboard.getCampaignSummary(
                  requestData: request.toJson(),
                );

        if (response.result == true) {
          campaigns(response.data);
          props.useState(UseState.done);
        } else {
          throw response;
        }
      } else if (endpoint == 'campaignYearSummary') {
        CampaignSummaryYearRes response =
            await Get.find<Api>().dashboard.getCampaignSummaryYear(
                  requestData: request.toJson(),
                );

        if (response.result == true) {
          campaigns(response.data);
          props.useState(UseState.done);
        } else {
          throw response;
        }
      } else if (endpoint == 'campaignYearMonthSummary') {
        CampaignSummaryMonthRes response =
            await Get.find<Api>().dashboard.getCampaignSummaryMonth(
                  requestData: request.toJson(),
                );

        if (response.result == true) {
          campaigns(response.data);
          props.useState(UseState.done);
        } else {
          throw response;
        }
      } else if (endpoint == 'campaignYearMonthDaySummary') {
        CampaignSummaryDayRes response =
            await Get.find<Api>().dashboard.getCampaignSummaryDay(
                  requestData: request.toJson(),
                );

        if (response.result == true) {
          campaigns(response.data);
          props.useState(UseState.done);
        } else {
          throw response;
        }
      }
    } on CampaignSummaryRes catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      props.useState(UseState.done);
      props.error(UseError(message: e.toString()));
    } on DioResponse catch (e) {
      props.useState(UseState.done);
      props.error(UseError(message: e.message));
    } catch (e) {
      props.useState(UseState.done);
      props.error(UseError(message: e.toString()));
    }
  }

  Future reset(endpoint) async {
    props.error.value.message = null;

    for (var channel in channelTypes) {
      console.log(channel.isSelectedSwitch);
      channel.isSelectedSwitch(true);
    }

    if (endpoint == "channelType") {
      request = CampaignSummaryReq(channelType: channels);
      console.log(channels);
      Get.back();
      await getCampaignSummary(endpoint: endpoint);
    } else if (endpoint == "campaignYearSummary") {
      year.value = DateTime.now().year.toString();
      request = CampaignSummaryReq(
          channelType: channels, year: int.tryParse(year.value.toString()));
      Get.back();
      await getCampaignSummary(endpoint: endpoint);
    } else if (endpoint == "campaignYearMonthSummary") {
      year.value = DateTime.now().year.toString();
      month.value = DateTime.now().month.monthName;
      request = CampaignSummaryReq(
        channelType: channels,
        year: int.tryParse(year.value.toString()),
        month: int.tryParse(month.value.toString().monthNumber),
      );
      Get.back();
      await getCampaignSummary(endpoint: endpoint);
    } else if (endpoint == "campaignYearMonthDaySummary") {
      day.value = DateTime.now();
      request = CampaignSummaryReq(
        channelType: channels,
        year: day.value?.year,
        month: day.value?.month,
        day: day.value?.day,
      );
      Get.back();
      await getCampaignSummary(endpoint: endpoint);
    }
  }

  Future onPressedFilterByChannels() async {
    request = CampaignSummaryReq(channelType: channels);
    Get.back();
    await getCampaignSummary(endpoint: "channelType");
  }

  Future onPressedFilterByYear() async {
    request = CampaignSummaryReq(
        channelType: channels, year: int.tryParse(year.value.toString()));
    Get.back();
    await getCampaignSummary(endpoint: 'campaignYearSummary');
  }

  Future onPressedFilterByMonth() async {
    request = CampaignSummaryReq(
      channelType: channels,
      year: int.tryParse(year.value.toString()),
      month: int.tryParse(month.value.toString().monthNumber),
    );
    Get.back();
    await getCampaignSummary(endpoint: 'campaignYearMonthSummary');
  }

  Future onPressedFilterByDay() async {
    console.log({
      'day': day.value?.day,
      'month': day.value?.month,
      'year': day.value?.year
    });
    request = CampaignSummaryReq(
      channelType: channels,
      year: day.value?.year,
      month: day.value?.month,
      day: day.value?.day,
    );
    Get.back();
    await getCampaignSummary(endpoint: 'campaignYearMonthDaySummary');
  }

  Future tryAgain() async {
    props.error.value.message = null;
    await getCampaignSummary();
  }
}
