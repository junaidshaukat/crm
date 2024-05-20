import '/core/app_export.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'no_internet_connection']) {
    _message = message.tr;
  }

  @override
  String toString() {
    return _message;
  }
}

class DioResponse implements Exception {
  final String? instanceId;
  final bool? result;
  final String? message;
  final dynamic messageDetails;
  final dynamic data;
  final dynamic errors;

  DioResponse({
    required this.instanceId,
    required this.result,
    required this.message,
    this.messageDetails,
    this.data,
    this.errors,
  });

  factory DioResponse.badCertificate(String message) {
    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.badResponse(Response? response, {String? message}) {
    String? instanceId;
    bool? result;
    dynamic data;
    dynamic errors;

    if (response?.statusCode == 401 &&
        response?.requestOptions.path != "/api/admin/v1/auth/login") {
      EnvConfig env = EnvConfig();
      env.delete(entries: ["adminToken"]).then((res) {
        return Get.offAndToNamed(AppRoutes.splash);
      });
    }

    if (response?.data != null) {
      instanceId = response?.data['instanceId'];

      result = response?.data['result'];

      if (response?.data['message'].toString().trim() != '') {
        message = response?.data['message'];
      }

      if (response?.data['messageDetails'] is String) {
        message = response?.data['messageDetails'];
      }

      if (response?.data['messageDetails'] is List) {
        List messageDetails = response?.data['messageDetails'];
        if (messageDetails.isNotEmpty) {
          message = messageDetails.map((item) => "• $item").join("\n");
        }
      }

      data = response?.data['data'];
      errors = response?.data['errors'];
    }

    return DioResponse(
      instanceId: instanceId,
      result: result,
      message: message,
      messageDetails: response?.data['messageDetails'],
      data: data,
      errors: errors,
    );
  }

  factory DioResponse.cancel(String message) {
    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.connectionError(String message) {
    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.connectionTimeout(String message) {
    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.receiveTimeout(String message) {
    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.sendTimeout(String message) {
    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.unknown(String message) {
    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }

  factory DioResponse.other(String message) {
    return DioResponse(
      instanceId: 'instanceId',
      result: false,
      message: message,
      messageDetails: [message],
      data: [],
    );
  }
}

class DioExceptions implements Exception {
  DioExceptions();

  build(DioException e, {bool debug = false}) {
    if (debug) {
      console.log({
        'type': e.type,
        'error': e.error,
        'message': e.message,
        'response': {
          'statusCode': e.response?.statusCode,
          'statusMessage': e.response?.statusMessage,
          'data': e.response?.data,
        },
        'data': e.requestOptions.data,
        'path': e.requestOptions.path,
        'uri': e.requestOptions.uri,
      }, name: 'DioException build');
    }

    if (e.type == DioExceptionType.badCertificate) {
      throw DioResponse.badCertificate("the_connection_error".tr);
    } else if (e.type == DioExceptionType.badResponse) {
      if (e.response != null) {
        throw DioResponse.badResponse(
          e.response,
          message: e.response?.statusMessage ?? e.message,
        );
      } else {
        throw DioResponse.badResponse(
          Response(
            data: {
              'instanceId': 'instanceId',
              'result': false,
              'message': 'bad_response'.tr,
              'messageDetails': ['bad_response'.tr],
              'data': [],
            },
            requestOptions: RequestOptions(),
          ),
        );
      }
    } else if (e.type == DioExceptionType.cancel) {
      throw DioResponse.cancel("request_is_cancelled".tr);
    } else if (e.type == DioExceptionType.connectionError) {
      throw DioResponse.connectionError("connection_error".tr);
    } else if (e.type == DioExceptionType.connectionTimeout) {
      throw DioResponse.connectionTimeout("connection_timeout".tr);
    } else if (e.type == DioExceptionType.receiveTimeout) {
      throw DioResponse.receiveTimeout("receiving_timeout".tr);
    } else if (e.type == DioExceptionType.sendTimeout) {
      throw DioResponse.sendTimeout("sent_timeout".tr);
    } else if (e.type == DioExceptionType.unknown) {
      throw DioResponse.unknown("unknown_error".tr);
    } else {
      throw DioResponse.other("other_error".tr);
    }
  }
}
