import '/core/app_export.dart';

class DashboardApis extends Client {
  Future<ProfileRes> getProfile({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.get(
        '/api/admin/v1/auth/profile',
        options: Options(headers: headers),
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return ProfileRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? ProfileRes.fromJson(response.data)
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

  Future<ProfileRes> getOrganizations({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.get(
        '/api/admin/v1/auth/profile',
        options: Options(headers: headers),
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return ProfileRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? ProfileRes.fromJson(response.data)
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

  Future<DonorsAndFollowersRes> getDonorsAndFollowers({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();

      await isNetworkConnected();
      Response response = await dio.get(
        '/api/admin/v1/dashboard/numberOfFollowers',
        options: Options(headers: headers),
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return DonorsAndFollowersRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? DonorsAndFollowersRes.fromJson(response.data)
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

  Future<TotalTransactionsRes> getTotalTransactions({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();

      await isNetworkConnected();
      Response response = await dio.get(
        '/api/admin/v1/dashboard/totalTransactions',
        options: Options(headers: headers),
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return TotalTransactionsRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? TotalTransactionsRes.fromJson(response.data)
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

  Future<ThisYearTransactionsRes> getThisYearTransactions({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();

      await isNetworkConnected();
      Response response = await dio.get(
        '/api/admin/v1/dashboard/totalTransactionsOfYear',
        options: Options(headers: headers),
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return ThisYearTransactionsRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? ThisYearTransactionsRes.fromJson(response.data)
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

  Future<DonationSinceRes> getDonationSince({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();

      await isNetworkConnected();
      Response response = await dio.get(
        '/api/admin/v1/dashboard/totalDonations',
        options: Options(headers: headers),
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return DonationSinceRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? DonationSinceRes.fromJson(response.data)
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

  Future<DonationYearRes> getDonationYear({
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
        '/api/admin/v1/dashboard/totalDonationOfYear',
        options: Options(headers: headers),
        queryParameters: requestData,
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return DonationYearRes.fromJson(response.data, requestData);
      } else {
        throw response.data != null
            ? DonationYearRes.fromJson(response.data, requestData)
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

  Future<DonationDayRes> getDonationDay({
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
        '/api/admin/v1/dashboard/daySummary',
        options: Options(headers: headers),
        queryParameters: requestData,
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return DonationDayRes.fromJson(response.data, requestData);
      } else {
        throw response.data != null
            ? DonationDayRes.fromJson(response.data, requestData)
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

  Future<DonationMonthRes> getDonationMonth({
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
        '/api/admin/v1/dashboard/monthSummary',
        options: Options(headers: headers),
        queryParameters: requestData,
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return DonationMonthRes.fromJson(response.data, requestData);
      } else {
        throw response.data != null
            ? DonationMonthRes.fromJson(response.data, requestData)
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

  Future<SetOrganizationRes> setOrganization({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();

      await isNetworkConnected();
      Response response = await dio.put(
        '/api/admin/v1/auth/setOrganization',
        options: Options(headers: headers),
        data: requestData,
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return SetOrganizationRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? SetOrganizationRes.fromJson(response.data)
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

  Future<CampaignSummaryRes> getCampaignSummary({
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
        '/api/admin/v1/dashboard/campaignSummary',
        options: Options(headers: headers),
        queryParameters: requestData,
        data: requestData,
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return CampaignSummaryRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CampaignSummaryRes.fromJson(response.data)
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

  Future<CampaignSummaryYearRes> getCampaignSummaryYear({
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
        '/api/admin/v1/dashboard/campaignYearSummary',
        options: Options(headers: headers),
        data: requestData,
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return CampaignSummaryYearRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CampaignSummaryYearRes.fromJson(response.data)
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

  Future<CampaignSummaryMonthRes> getCampaignSummaryMonth({
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
        '/api/admin/v1/dashboard/campaignYearMonthSummary',
        options: Options(headers: headers),
        data: requestData,
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return CampaignSummaryMonthRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CampaignSummaryMonthRes.fromJson(response.data)
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

  Future<CampaignSummaryDayRes> getCampaignSummaryDay({
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
        '/api/admin/v1/dashboard/campaignYearMonthDaySummary',
        options: Options(headers: headers),
        data: requestData,
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return CampaignSummaryDayRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CampaignSummaryDayRes.fromJson(response.data)
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

  Future<RecurringSummaryRes> getRecurringSummary({
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
        '/api/admin/v1/dashboard/recurring',
        options: Options(headers: headers),
        data: requestData,
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();

      if (isSuccessCall(response)) {
        return RecurringSummaryRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? RecurringSummaryRes.fromJson(response.data)
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
