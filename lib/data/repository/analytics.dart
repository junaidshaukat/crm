import '/core/app_export.dart';

class AnalyticsApis extends Client {
  AnalyticsApis();

  Future<YearOverYearRes> yearOverYears({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/yearOverYears',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return YearOverYearRes.fromJson(response.data, requestData);
      } else {
        throw response.data != null
            ? YearOverYearRes.fromJson(response.data, requestData)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<TenderTypesRes> tenderTypes({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();
      Response response = await dio.get(
        '/api/admin/v1/dashboard/tenderTypes',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return TenderTypesRes.fromJson(response.data, requestData);
      } else {
        throw response.data != null
            ? TenderTypesRes.fromJson(response.data, requestData)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<ChannelTypesRes> channelTypes({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/channelTypeSummary',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return ChannelTypesRes.fromJson(response.data, requestData);
      } else {
        throw response.data != null
            ? ChannelTypesRes.fromJson(response.data, requestData)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<ReceiptedRes> receipted({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
      'Authorization': 'Bearer {{adminToken}}',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/receipted',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return ReceiptedRes.fromJson(response.data, requestData);
      } else {
        throw response.data != null
            ? ReceiptedRes.fromJson(response.data, requestData)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }
}
