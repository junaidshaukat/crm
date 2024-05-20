import '/core/app_export.dart';

class RecognizedApis extends Client {
  Future<RecognizedCardRes> recognized({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.post(
        '{{localhost}}/recognized',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return RecognizedCardRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? RecognizedCardRes.fromJson(response.data)
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
