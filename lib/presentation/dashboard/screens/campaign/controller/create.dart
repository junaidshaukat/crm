import 'package:flutter/material.dart';

import '/core/app_export.dart';

class CreateCampaignController extends GetxController {
  Props props = Props();
  Props propsIcons = Props();
  Props propsNodes = Props();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<List<IconsData>> icons = Rx([]);
  Rx<List<NodeData>> nodes = Rx([]);

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController iconController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController targetAmountController =
      TextEditingController(text: '0');
  TextEditingController minimumAmountController =
      TextEditingController(text: '0');
  TextEditingController feesController = TextEditingController(text: '0');
  TextEditingController sortOrderController = TextEditingController(text: '1');
  TextEditingController taxReceiptRatioController =
      TextEditingController(text: '0');

  Rx<IconsData> icon = Rx(IconsData());

  Rx<bool> statusController = false.obs;
  Rx<bool> issueTaxReceiptController = false.obs;
  Rx<bool> donationCampaignController = false.obs;
  Rx<bool> hiddenController = false.obs;
  Rx<bool> enableQuantityController = false.obs;
  Rx<bool> allowRecurringModificationController = false.obs;

  Rx<String?> endDate = Rx(null);
  Rx<String?> endTime = Rx(null);
  Rx<String?> startDate = Rx(null);
  Rx<String?> startTime = Rx(null);
  Rx<String?> recurringDay = Rx(null);

  RxList<String> amounts = <String>[].obs;
  RxList<String> frequency = <String>[].obs;
  List<String> frequencies = [
    "ONETIME",
    "DAILY",
    "WEEKLY",
    "BIWEEKLY",
    "MONTHLY"
  ];

  @override
  Future<void> onReady() async {
    super.onReady();
    await Future.wait([
      getNodes(),
      getIcons(),
    ]);
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    descriptionController.dispose();
    iconController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    targetAmountController.dispose();
    minimumAmountController.dispose();
    feesController.dispose();
    sortOrderController.dispose();
    taxReceiptRatioController.dispose();
  }

  Future getIcons() async {
    try {
      propsIcons.useState(UseState.loading);
      IconsReadRes response = await Get.find<Api>().icons.read();
      if (response.result == true) {
        icons(response.data);
        propsIcons.useState(UseState.done);
      } else {
        throw response;
      }
    } on IconsReadRes catch (e) {
      propsIcons.useState(UseState.error);
      propsIcons.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsIcons.useState(UseState.error);
      propsIcons.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsIcons.useState(UseState.error);
      propsIcons.error(UseError(message: e.toString()));
    } catch (e) {
      propsIcons.useState(UseState.error);
      propsIcons.error(UseError(message: e.toString()));
    }
  }

  Future getNodes() async {
    try {
      propsNodes.useState(UseState.loading);
      NodeReadRes response = await Get.find<Api>().nodes.read();
      if (response.result == true) {
        nodes(response.data);
        propsNodes.useState(UseState.done);
      } else {
        throw response;
      }
    } on NodeReadRes catch (e) {
      propsNodes.useState(UseState.error);
      propsNodes.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsNodes.useState(UseState.error);
      propsNodes.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsNodes.useState(UseState.error);
      propsNodes.error(UseError(message: e.toString()));
    } catch (e) {
      propsNodes.useState(UseState.error);
      propsNodes.error(UseError(message: e.toString()));
    }
  }

  Future clear() async {
    props.useState(UseState.processing);
    icon(IconsData());
    amounts.clear();
    frequency.clear();
    endDate = Rx(null);
    endTime = Rx(null);
    startDate = Rx(null);
    startTime = Rx(null);
    nameController.clear();
    iconController.clear();
    recurringDay = Rx(null);
    endDateController.clear();
    feesController.text = '0';
    startDateController.clear();
    descriptionController.clear();
    sortOrderController.text = '1';
    statusController.value = false;
    hiddenController.value = false;
    targetAmountController.text = '0';
    minimumAmountController.text = '0';
    taxReceiptRatioController.text = '0';
    issueTaxReceiptController.value = false;
    donationCampaignController.value = false;
    allowRecurringModificationController.value = false;
    props.useState(UseState.done);
    update();
  }

  Future create(
      Map<String, dynamic> requestData, void Function(String)? event) async {
    try {
      props.useState(UseState.processing);

      CampaignCreateRes response =
          await Get.find<Api>().campaign.create(requestData: requestData);

      if (response.result == true) {
        event!("update");
        props.useState(UseState.none);
        await clear();
        Get.back();
        Toasts.success(
          message: response.message.toString(),
        );
        await getNodes();
      } else {
        throw response;
      }
    } on CampaignCreateRes catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
      Toasts.error(
        message: e.message.toString(),
      );
    } on DioResponse catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
      Toasts.error(
        message: e.message.toString(),
      );
    } on NoInternetException catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    } catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.error(
        message: e.toString(),
      );
    }
  }

  void selectIcon(IconsData data) {
    icon(data);
    iconController.text = data.tagNumber.toString();
    Get.back();
    update();
  }

  void clearStartDateController() {
    startDate.value = null;
    startDateController.clear();
    update();
  }

  void clearEndDateController() {
    endDate.value = null;
    endDateController.clear();
    update();
  }
}
