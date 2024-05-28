import '/core/app_export.dart';

class OrganizationApis extends Client {
  OrganizationApis();

  /// api/admin/v1/organization
  Future<OrganizationRes> organization({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/organization',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return OrganizationRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? OrganizationRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/organization/$tagNumber
  Future<OrganizationProfileUpdateRes> organizationProfileUpdate({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    int? tagNumber,
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.put(
        '/api/admin/v1/organization/$tagNumber',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return OrganizationProfileUpdateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? OrganizationProfileUpdateRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/organization/$tagNumber
  Future<OrganizationAddressUpdateRes> organizationAddressUpdate({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    int? tagNumber,
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.put(
        '/api/admin/v1/organization/$tagNumber',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return OrganizationAddressUpdateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? OrganizationAddressUpdateRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/organization/$tagNumber
  Future<OrganizationSupplementaryDataUpdateRes>
      organizationSupplementaryDataUpdate({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    int? tagNumber,
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.put(
        '/api/admin/v1/organization/$tagNumber',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return OrganizationSupplementaryDataUpdateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? OrganizationSupplementaryDataUpdateRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/organization/$tagNumber
  Future<OrganizationContactUpdateRes> organizationContactUpdate({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    int? tagNumber,
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.put(
        '/api/admin/v1/organization/$tagNumber',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return OrganizationContactUpdateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? OrganizationContactUpdateRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/signature?_method=PUT
  Future<OrganizationSignatureUpdateRes> signatureUpdate({
    Map<String, String> headers = const {
      'Content-type': 'multipart/form-data',
    },
    int? tagNumber,
    FormData? requestData,
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.post(
        '/api/admin/v1/signature?_method=PUT',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return OrganizationSignatureUpdateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? OrganizationSignatureUpdateRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/organization/$tagNumber
  Future<OrganizationCharityProfileUpdateRes> charityProfileUpdate({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    int? tagNumber,
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.put(
        '/api/admin/v1/organization/$tagNumber',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return OrganizationCharityProfileUpdateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? OrganizationCharityProfileUpdateRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/organization/$tagNumber
  Future<OrganizationSupplementaryCharityDataUpdateRes> charityAddressUpdate({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    int? tagNumber,
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.put(
        '/api/admin/v1/organization/$tagNumber',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return OrganizationSupplementaryCharityDataUpdateRes.fromJson(
            response.data);
      } else {
        throw response.data != null
            ? OrganizationSupplementaryCharityDataUpdateRes.fromJson(
                response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/organization/$tagNumber
  Future<OrganizationSupplementaryCharityDataUpdateRes>
      charitySupplementaryUpdate({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    int? tagNumber,
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.put(
        '/api/admin/v1/organization/$tagNumber',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return OrganizationSupplementaryCharityDataUpdateRes.fromJson(
            response.data);
      } else {
        throw response.data != null
            ? OrganizationSupplementaryCharityDataUpdateRes.fromJson(
                response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }
}
