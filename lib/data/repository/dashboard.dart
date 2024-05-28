import '/core/app_export.dart';

class DashboardApis extends Client {
  /// api/admin/v1/auth/profile
  Future<ProfileRes> getProfile({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/auth/profile',
        options: Options(headers: headers, extra: {'debug': debug}),
      );
      if (isSuccessCall(response, debug: debug)) {
        return ProfileRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? ProfileRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/auth/profile
  Future<ProfileRes> getOrganizations({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/auth/profile',
        options: Options(headers: headers, extra: {'debug': debug}),
      );
      if (isSuccessCall(response, debug: debug)) {
        return ProfileRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? ProfileRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/dashboard/numberOfFollowers
  Future<DonorsAndFollowersRes> getDonorsAndFollowers({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/numberOfFollowers',
        options: Options(headers: headers, extra: {'debug': debug}),
      );

      if (isSuccessCall(response, debug: debug)) {
        return DonorsAndFollowersRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? DonorsAndFollowersRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/dashboard/totalTransactions
  Future<TotalTransactionsRes> getTotalTransactions({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/totalTransactions',
        options: Options(headers: headers, extra: {'debug': debug}),
      );

      if (isSuccessCall(response, debug: debug)) {
        return TotalTransactionsRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? TotalTransactionsRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/dashboard/totalTransactionsOfYear
  Future<ThisYearTransactionsRes> getThisYearTransactions({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/totalTransactionsOfYear',
        options: Options(headers: headers, extra: {'debug': debug}),
      );

      if (isSuccessCall(response, debug: debug)) {
        return ThisYearTransactionsRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? ThisYearTransactionsRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/dashboard/totalDonations
  Future<DonationSinceRes> getDonationSince({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/totalDonations',
        options: Options(headers: headers, extra: {'debug': debug}),
      );

      if (isSuccessCall(response, debug: debug)) {
        return DonationSinceRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? DonationSinceRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/dashboard/totalDonationOfYear
  Future<DonationYearRes> getDonationYear({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/totalDonationOfYear',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return DonationYearRes.fromJson(response.data, requestData);
      } else {
        throw response.data != null
            ? DonationYearRes.fromJson(response.data, requestData)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/dashboard/daySummary
  Future<DonationDayRes> getDonationDay({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/daySummary',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return DonationDayRes.fromJson(response.data, requestData);
      } else {
        throw response.data != null
            ? DonationDayRes.fromJson(response.data, requestData)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/dashboard/monthSummary
  Future<DonationMonthRes> getDonationMonth({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/monthSummary',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return DonationMonthRes.fromJson(response.data, requestData);
      } else {
        throw response.data != null
            ? DonationMonthRes.fromJson(response.data, requestData)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/auth/setOrganization
  Future<SetOrganizationRes> setOrganization({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.put(
        '/api/admin/v1/auth/setOrganization',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return SetOrganizationRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? SetOrganizationRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/dashboard/campaignSummary
  Future<CampaignSummaryRes> getCampaignSummary({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/campaignSummary',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return CampaignSummaryRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CampaignSummaryRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/dashboard/campaignYearSummary
  Future<CampaignSummaryYearRes> getCampaignSummaryYear({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/campaignYearSummary',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return CampaignSummaryYearRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CampaignSummaryYearRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/dashboard/campaignYearMonthSummary
  Future<CampaignSummaryMonthRes> getCampaignSummaryMonth({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/campaignYearMonthSummary',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return CampaignSummaryMonthRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CampaignSummaryMonthRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/dashboard/campaignYearMonthDaySummary
  Future<CampaignSummaryDayRes> getCampaignSummaryDay({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/campaignYearMonthDaySummary',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return CampaignSummaryDayRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CampaignSummaryDayRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/dashboard/recurring
  Future<RecurringSummaryRes> getRecurringSummary({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/dashboard/recurring',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return RecurringSummaryRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? RecurringSummaryRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }
}
