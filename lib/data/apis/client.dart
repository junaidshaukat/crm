import '/core/app_export.dart';

class Client {
  Dio get dio {
    Dio client = Dio();
    client.options.baseUrl = EnvConfig().baseUrl;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    if (EnvConfig().adminToken != null) {
      headers.addAll({'Authorization': "Bearer ${EnvConfig().adminToken}"});
    }

    client.options.headers = headers;

    client.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        logPrint: (o) => console.log(o.toString(), name: 'LogInterceptor'),
      ),
    );

    return client;
  }

  bool isSuccessCall(Response response, {bool debug = false}) {
    if (debug) {
      console.log({
        'headers': response.headers,
        'extra': response.extra,
        'statusMessage': response.statusMessage,
        'data': response.data,
      }, name: 'isSuccessCall');
    }
    return response.statusCode! >= 200 && response.statusCode! < 300;
  }

  void isNetworkConnected({bool debug = false}) {
    if (Get.find<Internet>().connected.isFalse) {
      if (debug) {
        console.log('no_internet_found'.tr, name: 'isNetworkConnected');
      }

      throw NoInternetException('no_internet_found'.tr);
    }
  }

  DioException dioException(DioException response, {bool debug = false}) {
    if (debug) {
      console.log(response, name: 'DioException');
    }

    throw DioExceptions().build(response, debug: debug);
  }
}
