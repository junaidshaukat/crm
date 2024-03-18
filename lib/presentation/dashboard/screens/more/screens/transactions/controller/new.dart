import 'package:flutter/material.dart';
import '/core/app_export.dart';

class NewTransactionController extends GetxController {
  Props props = Props();
  TransactionsController controller = Get.find<TransactionsController>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController noOfRecurringController = TextEditingController();
  Rx<ActiveCampaign> campaign = Rx(ActiveCampaign());
  Rx<Frequency> frequency = Rx(Frequency.frequencies.first);
  RxString groupValue = RxString("static");

  @override
  onClose() {
    super.onClose();
    emailController.dispose();
    notesController.dispose();
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
        Get.to(
          () => CardScreen(
            requestData: requestData,
            currencySymbol: currencySymbol,
            email: emailController.text,
            notes: notesController.text,
            amount: amountController.text,
            campaign: campaign.value,
            frequency: frequency.value,
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
