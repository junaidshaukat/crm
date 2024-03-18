import 'dart:typed_data';
import 'package:flutter/material.dart';
import '/core/app_export.dart';

class ReportsController extends GetxController {
  Props props = Props();
  Props propsReportForm = Props();
  RxList<Fields> fields = RxList([]);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxList<ReportData> reportData = RxList([]);
  Rx<ReportData?> reportDataSelect = Rx(null);
  RxList<ReportFormData> reportFormData = RxList([]);

  Map<String, dynamic> filter = {};

  @override
  void onReady() async {
    super.onReady();
    await Future.wait([reportCaller()]);
  }

  Future reportCaller() async {
    try {
      props.useState(UseState.loading);

      ReportReq request = ReportReq();

      ReportRes response = await Get.find<Api>().report.caller(
            requestData: request.toJson(),
          );
      if (response.result == true) {
        props.useState(UseState.none);
        reportData(response.data);
      } else {
        throw response;
      }
    } on ReportRes catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
    } catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
    }
  }

  Future onChangedForm(option) async {
    filter.clear();
    reportDataSelect.value = option.value;
    filter['reportTag'] = reportDataSelect.value?.tagNumber;
    await reportForm(reportDataSelect.value);
  }

  Future reportForm(ReportData? form) async {
    try {
      propsReportForm.useState(UseState.loading);
      ReportFormRes response =
          await Get.find<Api>().report.form(tagNumber: form?.tagNumber);
      if (response.result == true) {
        propsReportForm.useState(UseState.done);
        reportFormData(response.data);
      } else {
        throw response;
      }
    } on ReportFormRes catch (e) {
      propsReportForm.useState(UseState.none);
      propsReportForm.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      propsReportForm.useState(UseState.none);
      propsReportForm.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      propsReportForm.useState(UseState.none);
      propsReportForm.error(UseError(message: e.toString()));
    } catch (e) {
      propsReportForm.useState(UseState.none);
      propsReportForm.error(UseError(message: e.toString()));
    }
  }

  String extractFilename(String contentDisposition) {
    final regex = RegExp('filename=(".*")');
    final match = regex.firstMatch(contentDisposition);
    if (match != null) {
      return match.group(1)!.replaceAll('"', '');
    }
    return '';
  }

  Future<void> savePdf(Uint8List data, String fileName, String mimeType) async {
    await DocumentFileSavePlus().saveFile(data, fileName, mimeType);
    Toasts.success(message: "report_saved".tr);
  }

  Future onGenerateReport() async {
    try {
      console.log(filter, name: 'filter');

      props.useState(UseState.downloading);
      ReportGenrateReq request = ReportGenrateReq.fromJson(filter);
      ReportGenrateRes response = await Get.find<Api>()
          .report
          .genrate(requestData: request.toJson(filter: filter));
      if (response.result == true) {
        props.useState(UseState.none);
        await savePdf(response.data!, extractFilename(response.fileName!),
            response.mimeType!);
      } else {
        throw response;
      }
    } on DioResponse catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
      Toasts.warning(message: e.message);
    } on NoInternetException catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.warning(message: e.toString());
    } catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.error(message: e.toString());
    }
  }
}
