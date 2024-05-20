import '/core/app_export.dart';

class CampaignApis extends Client {
  CampaignApis();

  Future<CampaignsRes> read({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/campaign',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return CampaignsRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CampaignsRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<CampaignCreateRes> create({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.post(
        '/api/admin/v1/campaign',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return CampaignCreateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CampaignCreateRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<CampaignUpdateRes> update({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = true,
    num? tagNumber,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.put(
        '/api/admin/v1/campaign/$tagNumber',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return CampaignUpdateRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CampaignUpdateRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<CampaignsRes> delete({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    String? tagNumber,
    bool debug = true,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.delete(
        '/api/admin/v1/campaign/$tagNumber',
        options: Options(headers: headers, extra: {'debug': debug}),
      );
      if (isSuccessCall(response, debug: debug)) {
        return CampaignsRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? CampaignsRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }
}
