import '/core/app_export.dart';

class Client {
  final String _baseUrl = EnvConfig().hostname;
  Dio get dio {
    Dio client = Dio();
    client.options.baseUrl = _baseUrl;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    if (EnvConfig().adminToken != null) {
      headers.addAll({'Authorization': "Bearer ${EnvConfig().adminToken}"});
    }

    client.options.headers = headers;

    return client;
  }

  bool isSuccessCall(Response response, {bool debug = false}) {
    if (debug) {
      console.log(response.headers, name: 'isSuccessCall');
      console.log(response.extra, name: 'isSuccessCall');
      console.log(response.statusMessage, name: 'isSuccessCall');
      console.log(response.data, name: 'isSuccessCall');
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
