import 'package:flutter/material.dart';
import '/core/app_export.dart';

class NewTransactionController extends GetxController {
  Props props = Props();
  TransactionsController controller = Get.find<TransactionsController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNotesController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController noOfRecurringController = TextEditingController();
  Rx<ActiveCampaign> campaign = Rx(ActiveCampaign());

  List<Frequency> frequencies = [
    Frequency(
      id: "1",
      title: "ONE-TIME",
      value: "ONETIME",
      variation: false,
      noOfRecurring: 1,
    ),
    Frequency(
      id: "1",
      title: "DAILY",
      value: "DAILY",
      variation: true,
      noOfRecurring: 1,
    ),
    Frequency(
      id: "1",
      title: "WEEKLY",
      value: "WEEKLY",
      variation: true,
      noOfRecurring: 1,
    ),
    Frequency(
      id: "1",
      title: "BIWEEKLY",
      value: "BIWEEKLY",
      variation: true,
      noOfRecurring: 1,
    ),
    Frequency(
      id: "1",
      title: "MONTHLY",
      value: "MONTHLY",
      variation: true,
      noOfRecurring: 1,
    ),
  ];

  Rx<Frequency> frequency = Rx(Frequency(
    id: "1",
    title: "ONE-TIME",
    value: "ONETIME",
    variation: false,
    noOfRecurring: 1,
  ));
  RxString groupValue = RxString("static");

  late TransactionReq request;

  @override
  void onInit() {
    super.onInit();
    request = TransactionReq();
  }

  @override
  onClose() {
    super.onClose();
    emailController.dispose();
    userNotesController.dispose();
    amountController.dispose();
  }

  Future<void> wallet(
    Map<String, dynamic> requestData,
    String? currencySymbol,
  ) async {
    try {
      props.useState(UseState.processing);
      WalletRes response = await Get.find<Api>().transactions.wallet(
            requestData: requestData,
          );
      if (response.result == true) {
        props.useState(UseState.none);

        request.campaignTag = campaign.value.campaignTag;
        request.campaign = campaign.value.label;
        request.fees = campaign.value.fees ?? 0;
        request.amount =
            num.tryParse(amountController.text)?.toStringAsFixed(2) ?? '0.00';
        request.currencySymbol = currencySymbol;
        request.email = emailController.text;
        request.userNotes = userNotesController.text;
        request.billingPeriod = frequency.value.value;
        request.noOfRecurring = frequency.value.noOfRecurring;

        Get.to(
          () => CardScreen(
            request: request,
            wallets: response.data,
          ),
        );
      } else {
        throw response;
      }
    } on LoginRes catch (e) {
      props.useState(UseState.none);
      Toasts.error(message: e.message.toString());
    } on DioResponse catch (e) {
      props.useState(UseState.none);
      Toasts.error(message: e.message.toString());
    } on NoInternetException catch (e) {
      props.useState(UseState.none);
      Toasts.error(message: e.toString());
    } catch (e) {
      props.useState(UseState.none);
      Toasts.error(message: e.toString());
    }
  }
}
