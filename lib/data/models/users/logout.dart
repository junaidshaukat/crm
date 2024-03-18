import '/core/app_export.dart';

class UsersLogoutReq {
  UsersLogoutReq();

  factory UsersLogoutReq.fromJson(Map<String, dynamic> json) {
    return UsersLogoutReq();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UsersLogoutRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  dynamic data;

  UsersLogoutRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory UsersLogoutRes.fromJson(Map<String, dynamic> json,
      {Response? response}) {
    console.log(response);

    bool result = false;
    if (response != null) {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        result = true;
      }
    }

    return UsersLogoutRes(
      instanceId: json['instanceId'],
      result: result,
      message: json['message'],
      messageDetails: json['messageDetails'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'messageDetails': messageDetails,
      'data': data,
    };
  }
}
