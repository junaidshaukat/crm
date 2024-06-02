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

  // Client() {
  //   dio.options.baseUrl = _baseUrl;
  //   dio.options.connectTimeout = const Duration(seconds: 60); // 60 seconds
  //   dio.interceptors.add(InterceptorsWrapper(
  //     onRequest: (options, handler) {
  //       if (options.path.contains('{{localhost}}')) {
  //         options.baseUrl = 'http://localhost:3000';
  //         options.path = options.path.replaceAll('{{localhost}}', '');
  //       }

  //       bool debug = options.extra['debug'] ?? false;

  //       if (options.data is FormData) {
  //         FormData formData = options.data as FormData;
  //         List<MapEntry<String, String>> fields = formData.fields;
  //         List<MapEntry<String, MultipartFile>> files = formData.files;

  //         for (var field in fields) {
  //           String fieldName = field.key;
  //           String fieldValue = field.value;
  //           console.log('Field: $fieldName, Value: $fieldValue');
  //         }

  //         for (var file in files) {
  //           String fileName = file.key;
  //           MultipartFile fileValue = file.value;
  //           console.log({
  //             'fileName': fileName,
  //             'contentType': fileValue.contentType,
  //             'filename': fileValue.filename,
  //             'length': fileValue.length,
  //           });
  //           console.log('File: $fileName, Size: ${fileValue.length}');
  //         }
  //       }

  //       if (debug) {
  //         console.log(
  //           {
  //             'options': {
  //               'extra': options.extra,
  //               'data': options.data,
  //               'path': options.path,
  //               'uri': options.uri,
  //             },
  //             'handler': {'isCompleted': handler.isCompleted},
  //           },
  //           name: 'onRequest',
  //         );
  //       }

  //       Map<String, String> headers = {
  //         "Content-Type": "application/json",
  //         "Accept": "application/json",
  //       };

  //       if (EnvConfig().adminToken != null) {
  //         headers.addAll({'Authorization': "Bearer ${EnvConfig().adminToken}"});
  //       }

  //       options.headers.addAll(headers);
  //       return handler.next(options);
  //     },
  //   ));
  // }

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
