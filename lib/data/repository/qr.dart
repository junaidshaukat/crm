import '/core/app_export.dart';

class QrCodeApis extends Client {
  QrCodeApis();

  Future<QrReadRes> read({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/qrCode',
        options: Options(headers: headers, responseType: ResponseType.bytes),
        queryParameters: requestData,
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return QrReadRes.fromJson(response.data, response: response);
      } else {
        throw response.data != null
            ? QrReadRes.fromJson(response.data, response: response)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }
}
