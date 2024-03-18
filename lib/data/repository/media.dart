import '/core/app_export.dart';

class MediaApis extends Client {
  MediaApis();

  Future<WidgetRes> widget({
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
        '/api/admin/v1/widget',
        options: Options(headers: headers),
        queryParameters: requestData,
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return WidgetRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? WidgetRes.fromJson(response.data)
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

  Future<MediaRes> media({
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
        '/api/admin/v1/media',
        options: Options(headers: headers),
        queryParameters: requestData,
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return MediaRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? MediaRes.fromJson(response.data)
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

  Future<MediaDeleteRes> delete({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    num? tagNumber,
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.delete(
        '/api/admin/v1/media/$tagNumber',
        options: Options(headers: headers),
        queryParameters: requestData,
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return MediaDeleteRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? MediaDeleteRes.fromJson(response.data)
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

  Future<CreateMediaRes> create({
    Map<String, String> headers = const {
      'Content-type': 'multipart/form-data',
    },
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.post(
        '/api/admin/v1/media',
        options: Options(headers: headers),
        data: Formdata.fromMap(requestData),
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return CreateMediaRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CreateMediaRes.fromJson(response.data)
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

  Future<UpdateMediaRes> update({
    Map<String, String> headers = const {
      'Content-type': 'multipart/form-data',
    },
    int? tagNumber,
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.post(
        '/api/admin/v1/media/$tagNumber?_method=PUT',
        options: Options(headers: headers),
        data: Formdata.fromMap(requestData),
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return UpdateMediaRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? UpdateMediaRes.fromJson(response.data)
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

  Future<WidgetUpdateRes> updateWidget({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    num? tagNumber,
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.put(
        '/api/admin/v1/widget/$tagNumber',
        options: Options(headers: headers),
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return WidgetUpdateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? WidgetUpdateRes.fromJson(response.data)
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
}
