import '/core/app_export.dart';

class UsersSetLanguageReq {
  String? language;

  UsersSetLanguageReq({
    this.language,
  });

  factory UsersSetLanguageReq.fromJson(Map<String, dynamic> json) {
    return UsersSetLanguageReq(
      language: json['language'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
    };
  }
}

class UsersSetLanguageRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  dynamic data;

  UsersSetLanguageRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory UsersSetLanguageRes.fromJson(Map<String, dynamic> json) {
    return UsersSetLanguageRes(
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
