import '/core/app_export.dart';

class PublicApis extends Client {
  Future<CountryStateRes> states({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, String> requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/v1/public/state',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return CountryStateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CountryStateRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error, stackTrace) {
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
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/v1/public/country',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
        queryParameters: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return CountryRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CountryRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error, stackTrace) {
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
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.post(
        '/api/admin/v1/auth/login',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return LoginRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? LoginRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error, stackTrace) {
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
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.put(
        '/api/admin/v1/auth/resetPassword',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return ResetPasswordRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? ResetPasswordRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<ForgetPasswordRes> forgetPassword({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.put(
        '/api/admin/v1/auth/forgetPassword',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return ForgetPasswordRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? ForgetPasswordRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
