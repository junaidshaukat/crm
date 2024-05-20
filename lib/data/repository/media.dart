import '/core/app_export.dart';

class MediaApis extends Client {
  MediaApis();

  Future<WidgetRes> widget({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/widget',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return WidgetRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? WidgetRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<MediaRes> media({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/media',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return MediaRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? MediaRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<MediaDeleteRes> delete({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    num? tagNumber,
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.delete(
        '/api/admin/v1/media/$tagNumber',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return MediaDeleteRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? MediaDeleteRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<CreateMediaRes> create({
    Map<String, String> headers = const {
      'Content-type': 'multipart/form-data',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.post(
        '/api/admin/v1/media',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: Formdata.fromMap(requestData),
      );
      if (isSuccessCall(response, debug: debug)) {
        return CreateMediaRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CreateMediaRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<UpdateMediaRes> update({
    Map<String, String> headers = const {
      'Content-type': 'multipart/form-data',
    },
    int? tagNumber,
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.post(
        '/api/admin/v1/media/$tagNumber?_method=PUT',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: Formdata.fromMap(requestData),
      );
      if (isSuccessCall(response, debug: debug)) {
        return UpdateMediaRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? UpdateMediaRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<WidgetUpdateRes> updateWidget({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    num? tagNumber,
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.put(
        '/api/admin/v1/widget/$tagNumber',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return WidgetUpdateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? WidgetUpdateRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }
}
