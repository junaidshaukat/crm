import '/core/app_export.dart';

class Client {
  final String _baseUrl = EnvConfig().hostname;
  final Dio dio = Dio();

  Client() {
    dio.options.baseUrl = _baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 60); // 60 seconds
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        console.log(
          {
            'options': {
              'data': options.data,
              'path': options.path,
              'uri': options.uri,
            },
            'handler': {'isCompleted': handler.isCompleted},
          },
          name: 'onRequest',
        );

        Map<String, String> headers = {
          "Content-Type": "application/json",
          "Accept": "application/json",
        };

        if (EnvConfig().adminToken != null) {
          headers.addAll({'Authorization': "Bearer ${EnvConfig().adminToken}"});
        }

        options.headers.addAll(headers);
        return handler.next(options);
      },
    ));
  }

  bool isSuccessCall(Response response) {
    console.log(response.headers, name: 'isSuccessCall');
    console.log(response.extra, name: 'isSuccessCall');
    console.log(response.statusMessage, name: 'isSuccessCall');
    console.log(response.data, name: 'isSuccessCall');

    return response.statusCode! >= 200 && response.statusCode! < 300;
  }

  Future<void> isNetworkConnected() async {
    console.log(
      await Get.find<NetworkInfo>().isConnected(),
      name: 'isNetworkConnected',
    );

    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  DioException badResponse(Response<dynamic>? response) {
    console.log(response, name: 'badResponse');

    return DioException(
      type: DioExceptionType.badResponse,
      requestOptions: RequestOptions(),
      response: response,
    );
  }

  dioException(DioException response) {
    console.log(response, name: 'DioException response');

    throw DioExceptions().build(response);
  }
}
