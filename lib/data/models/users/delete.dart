import '/core/app_export.dart';

class UsersDeleteReq {
  String? tagNumber;

  UsersDeleteReq({
    this.tagNumber,
  });

  factory UsersDeleteReq.fromJson(Map<String, dynamic> json) {
    return UsersDeleteReq(
      tagNumber: json['tagNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tagNumber': tagNumber,
    };
  }
}

class UsersDeleteRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  dynamic data;

  UsersDeleteRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory UsersDeleteRes.fromJson(Map<String, dynamic> json) {
    return UsersDeleteRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
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
