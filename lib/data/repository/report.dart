

import '/core/app_export.dart';

class ReportApis extends Client {
  ReportApis();

  Future<ReportRes> caller({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.get(
        '/api/admin/v1/report',
        options: Options(headers: headers),
        queryParameters: requestData,
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return ReportRes.fromJson(response.data);
      } else {
        throw response.data != null ? ReportRes.fromJson(response.data) : 'Something Went Wrong!';
      }
    } on DioException catch (e) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      throw dioException(e);
    } catch (error, stackTrace) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<ReportFormRes> form({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
    num? tagNumber,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.get(
        '/api/admin/v1/report/$tagNumber',
        options: Options(headers: headers),
        queryParameters: requestData,
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return ReportFormRes.fromJson(response.data);
      } else {
        throw response.data != null ? ReportFormRes.fromJson(response.data) : 'Something Went Wrong!';
      }
    } on DioException catch (e) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      throw dioException(e);
    } catch (error, stackTrace) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<ReportGenrateRes> genrate({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
    num? tagNumber,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.get(
        '/api/admin/v1/reportHelper/preview',
        options: Options(headers: headers, responseType: ResponseType.bytes),
        queryParameters: requestData,
        data: requestData,
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return ReportGenrateRes.fromJson(response.data, response: response);
      } else {
        throw response.data != null ? ReportGenrateRes.fromJson(response.data, response: response) : 'Something Went Wrong!';
      }
    } on DioException catch (e) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      throw dioException(e);
    } catch (error, stackTrace) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
