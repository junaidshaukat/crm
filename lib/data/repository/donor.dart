import '/core/app_export.dart';

class DonorApis extends Client {
  DonorApis();

  Future<DonorReadRes> read({
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
        '/api/admin/v1/donor/donor',
        options: Options(headers: headers),
        queryParameters: requestData,
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return DonorReadRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? DonorReadRes.fromJson(response.data)
            : 'Something Went Wrong!';
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

  Future<DonorCreateRes> create({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.post(
        '/api/admin/v1/donor/donor',
        options: Options(headers: headers),
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return DonorCreateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? DonorCreateRes.fromJson(response.data)
            : 'Something Went Wrong!';
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

  Future<DonorUpdateRes> update({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    String? tagNumber,
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.put(
        '/api/admin/v1/donor/donor/$tagNumber',
        options: Options(headers: headers),
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return DonorUpdateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? DonorUpdateRes.fromJson(response.data)
            : 'Something Went Wrong!';
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

  Future<DonorDeleteRes> delete({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    String? id,
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.delete(
        '/api/admin/v1/donor/donor/$id',
        options: Options(headers: headers),
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return DonorDeleteRes.fromJson(response.data);
      } else {
        throw DioException(
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(),
          response: response,
        );
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
