import '/core/app_export.dart';

class HighlightsApis extends Client {
  HighlightsApis();

  /// api/admin/v1/donor/highlights/lifetime
  Future<LifetimeRes> lifetime({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/donor/highlights/lifetime',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return LifetimeRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? LifetimeRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/donor/highlights/keyDates
  Future<KeyDatesRes> keyDates({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/donor/highlights/keyDates',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return KeyDatesRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? KeyDatesRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/donor/highlights/yearly
  Future<YearlyRes> yearly({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/donor/highlights/yearly',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return YearlyRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? YearlyRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/donor/highlights/lastNthSummary
  Future<LastNthSummaryRes> lastNthSummary({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/donor/highlights/lastNthSummary',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return LastNthSummaryRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? LastNthSummaryRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/donor/highlights/campaignSummary
  Future<CampaignsDistributionRes> campaignsDistributions({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/donor/highlights/campaignSummary',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return CampaignsDistributionRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CampaignsDistributionRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/donor/highlights/recentTransactions
  Future<RecentTransactionsRes> recentTransactions({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/donor/highlights/recentTransaction',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return RecentTransactionsRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? RecentTransactionsRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/donor/highlights/lastNthSummary
  Future<TotalDonationsAmountRes> totalDonationsAmount({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/donor/highlights/yearOverYears',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return TotalDonationsAmountRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? TotalDonationsAmountRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }
}
