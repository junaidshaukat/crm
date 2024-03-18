import '/core/app_export.dart';

class ConfirmController extends GetxController {
  Props props = Props();
  TransactionsController controller = Get.find<TransactionsController>();
  Rx<bool> coverTransactionCosts = Rx(false);
  Rx<num> amount = Rx(0);
  Rx<num> fees = Rx(0);

  num percentage(num part, num whole) {
    return (part * whole) / 100;
  }

  Future<void> create(Map<String, dynamic> requestData) async {
    try {
      props.useState(UseState.processing);
      TransactionRes response = await Get.find<Api>().transactions.create(
            requestData: requestData,
          );
      if (response.result == true) {
        props.useState(UseState.none);
        Get.back();
        Get.back();
        Get.back();
        Toasts.success(message: response.message);
        controller.reloadData();
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
