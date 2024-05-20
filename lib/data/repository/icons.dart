import '/core/app_export.dart';

class IconsApis extends Client {
  IconsApis();

  Future<IconsReadRes> read({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/icon',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return IconsReadRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? IconsReadRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }
}
