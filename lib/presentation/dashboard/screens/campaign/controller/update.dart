import 'package:flutter/material.dart';
import '/core/app_export.dart';

class UpdateCampaignController extends GetxController {
  Props props = Props();
  Props propsIcons = Props();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<List<IconsData>> icons = Rx([]);
  Rx<List<NodeData>> nodes = Rx([]);

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController iconController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController targetAmountController = TextEditingController();
  TextEditingController minimumAmountController = TextEditingController();
  TextEditingController feesController = TextEditingController();
  TextEditingController sortOrderController = TextEditingController();

  Rx<IconsData> icon = Rx(IconsData());

  Rx<bool> statusController = false.obs;
  Rx<bool> issueTaxReceiptController = false.obs;
  Rx<bool> donationCampaignController = false.obs;

  Rx<String?> startDate = Rx(null);
  Rx<String?> startTime = Rx(null);
  Rx<String?> endDate = Rx(null);
  Rx<String?> endTime = Rx(null);

  @override
  Future<void> onInit() async {
    super.onInit();
    await getIcons();
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

  Future clear() async {
    props.useState(UseState.processing);
    nameController.clear();
    descriptionController.clear();
    iconController.clear();
    startDateController.clear();
    endDateController.clear();
    targetAmountController.clear();
    minimumAmountController.clear();
    feesController.clear();
    sortOrderController.clear();
    icon(IconsData());
    statusController.value = false;
    issueTaxReceiptController.value = false;
    startDate = Rx(null);
    startTime = Rx(null);
    endDate = Rx(null);
    endTime = Rx(null);
    props.useState(UseState.done);
    update();
  }

  Future updateCampaign(
    num? tagNumber,
    Map<String, dynamic> requestData,
    void Function(String)? event,
  ) async {
    try {
      props.useState(UseState.updating);

      CampaignUpdateRes response = await Get.find<Api>().campaign.update(
            tagNumber: tagNumber,
            requestData: requestData,
          );

      if (response.result == true) {
        event!("update");
        props.useState(UseState.done);
        Get.back();
        Toasts.success(
          message: response.message.toString(),
        );
      } else {
        throw response;
      }
    } on CampaignUpdateRes catch (e) {
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

  void setTextEditingController(CampaignData campaign) {
    nameController.text = campaign.name ?? '';
    descriptionController.text = campaign.description ?? '';
    iconController.text = campaign.icon?.tagNumber.toString() ?? '';
    startDateController.text = campaign.startDate ?? '';
    endDateController.text = campaign.endDate ?? '';
    targetAmountController.text = campaign.targetAmount.toString();
    minimumAmountController.text = campaign.minimumAmount.toString();
    feesController.text = campaign.fees.toString();
    sortOrderController.text = campaign.sortOrder.toString();
    icon(IconsData(
      tagNumber: campaign.icon?.tagNumber,
      filename: campaign.icon?.filename,
      width: campaign.icon?.width,
      height: campaign.icon?.height,
      tags: campaign.icon?.tags,
    ));
    nodes(
      campaign.nodes
          ?.map((e) => NodeData(
                tagNumber: e.tagNumber,
                nodeTag: e.nodeTag,
                organizationDefinedName: e.organizationDefinedName,
                active: e.active,
                status: e.status,
              ))
          .toList(),
    );
    statusController.value = campaign.status ?? false;
    issueTaxReceiptController.value = campaign.issueTaxReceipt ?? false;
    donationCampaignController.value = campaign.donationCampaign ?? false;
    update();
  }
}
