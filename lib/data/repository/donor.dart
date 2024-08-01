import '/core/app_export.dart';

class DonorApis extends Client {
  DonorApis();

  /// api/admin/v1/donor/donor
  Future<DonorReadRes> read({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/donor/donor',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return DonorReadRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? DonorReadRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/donor/nearBy
  Future<NearByRes> nearBy({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/donor/nearBy',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return NearByRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? NearByRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/donor/donor
  Future<DonorCreateRes> create({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.post(
        '/api/admin/v1/donor/donor',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return DonorCreateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? DonorCreateRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/donor/donor/$tagNumber
  Future<DonorUpdateRes> update({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    String? tagNumber,
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.put(
        '/api/admin/v1/donor/donor/$tagNumber',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return DonorUpdateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? DonorUpdateRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  /// api/admin/v1/donor/donor/$id
  Future<DonorDeleteRes> delete({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    String? id,
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.delete(
        '/api/admin/v1/donor/donor/$id',
        options: Options(headers: headers, extra: {'debug': debug}),
      );
      if (isSuccessCall(response, debug: debug)) {
        return DonorDeleteRes.fromJson(response.data);
      } else {
        throw DioException(
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(),
          response: response,
        );
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<UpdateProfileImageRes> updateProfileImage({
    Map<String, String> headers = const {
      'Content-type': 'multipart/form-data',
    },
    FormData? requestData,
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.post(
        '/api/admin/v1/donor/updateProfileImage?_method=PUT',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return UpdateProfileImageRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? UpdateProfileImageRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<DeleteProfileImageRes> deleteProfileImage({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.delete(
        '/api/admin/v1/donor/deleteProfileImage',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return DeleteProfileImageRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? DeleteProfileImageRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }
}
