import '/core/app_export.dart';

class HomeRecurringController extends GetxController {
  Props props = Props();
  Rx<DateTime> date = Rx(DateTime.now());

  Rx<RecurringSummary?> recurrings = Rx(null);
  final controller = Get.put(DashboardController());

  @override
  void onReady() async {
    controller.forceGreen.value = true;
    super.onReady();
    await getRecurringSummary();
  }

  @override
  void onClose() {
    controller.forceGreen.value = false;
    super.onClose();
  }

  Future getRecurringSummary() async {
    try {
      props.useState(UseState.loading);
      RecurringSummaryReq request = RecurringSummaryReq(
        year: date.value.year.toString(),
        month: date.value.month.toString().padLeft(2, '0'),
        day: date.value.day.toString().padLeft(2, '0'),
      );

      RecurringSummaryRes response =
          await Get.find<Api>().dashboard.getRecurringSummary(
                requestData: request.toJson(),
              );

      if (response.result == true) {
        props.useState(UseState.done);
        recurrings(response.data);
      } else {
        throw response;
      }
    } on RecurringSummaryRes catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.toString()));
    } catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.toString()));
    }
  }

  Future tryAgain() async {
    props.error(UseError(message: null));
    await getRecurringSummary();
  }

  void onPressedFilter() async {
    Get.back();
    await getRecurringSummary();
  }
}
