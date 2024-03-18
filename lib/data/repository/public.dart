import '/core/app_export.dart';

class PublicApis extends Client {
  Future<CountryStateRes> states({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, String> requestData = const {},
    bool showProgressDialog = false,
  }) async {
    if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await dio.get(
        '/api/v1/public/state',
        options: Options(headers: headers),
        queryParameters: requestData,
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return CountryStateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CountryStateRes.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } on DioException catch (e) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      throw dioException(e);
    } catch (error, stackTrace) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<CountryRes> country({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, String> requestData = const {},
    bool showProgressDialog = false,
  }) async {
    if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await dio.get(
        '/api/v1/public/country',
        options: Options(headers: headers),
        data: requestData,
        queryParameters: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return CountryRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CountryRes.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } on DioException catch (e) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      throw dioException(e);
    } catch (error, stackTrace) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<LoginRes> authLogin({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map requestData = const {},
    bool showProgressDialog = false,
  }) async {
    if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await dio.post(
        '/api/admin/v1/auth/login',
        options: Options(headers: headers),
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return LoginRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? LoginRes.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } on DioException catch (e) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      throw dioException(e);
    } catch (error, stackTrace) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<ResetPasswordRes> resetPassword({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map requestData = const {},
    bool showProgressDialog = false,
  }) async {
    if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await dio.put(
        '/api/admin/v1/auth/resetPassword',
        options: Options(headers: headers),
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return ResetPasswordRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? ResetPasswordRes.fromJson(response.data)
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

  Future<ForgetPasswordRes> forgetPassword({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map requestData = const {},
    bool showProgressDialog = false,
  }) async {
    if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await dio.put(
        '/api/admin/v1/auth/forgetPassword',
        options: Options(headers: headers),
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return ForgetPasswordRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? ForgetPasswordRes.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } on DioException catch (e) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      throw dioException(e);
    } catch (error, stackTrace) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
