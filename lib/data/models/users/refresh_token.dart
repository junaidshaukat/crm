import '/core/app_export.dart';

class UsersRefreshTokenReq {
  String? language;

  UsersRefreshTokenReq({
    this.language,
  });

  factory UsersRefreshTokenReq.fromJson(Map<String, dynamic> json) {
    return UsersRefreshTokenReq(
      language: json['language'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
    };
  }
}

class UsersRefreshTokenRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  dynamic data;

  UsersRefreshTokenRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory UsersRefreshTokenRes.fromJson(Map<String, dynamic> json) {
    return UsersRefreshTokenRes(
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
