import '/core/app_export.dart';

class UsersLoginReq {
  String? email;
  String? password;

  UsersLoginReq({this.email, this.password});

  factory UsersLoginReq.fromJson(Map<String, dynamic> json) {
    return UsersLoginReq(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password
    };
  }
}

class UsersLoginRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  UserData? data;

  UsersLoginRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory UsersLoginRes.fromJson(Map<String, dynamic> json) {
    return UsersLoginRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'messageDetails': messageDetails,
      'data': data?.toJson(),
    };
  }
}
