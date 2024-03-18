import '/core/app_export.dart';

class UsersCreateReq {
  String? requestType;
  String? email;
  String? accountPassword;
  String? firstName;
  String? lastName;
  String? language;
  String? role;
  bool? status;

  UsersCreateReq({
    this.requestType = "new",
    this.email,
    this.accountPassword,
    this.firstName,
    this.lastName,
    this.language = "en",
    this.role = 'super',
    this.status,
  });

  factory UsersCreateReq.fromJson(Map<String, dynamic> json) {
    return UsersCreateReq(
      requestType: json['requestType'],
      email: json['email'],
      accountPassword: json['accountPassword'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      language: json['language'],
      role: json['role'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'requestType': requestType,
      'email': email,
      'accountPassword': accountPassword,
      'firstName': firstName,
      'lastName': lastName,
      'language': language,
      'role': role,
      'status': status == true ? 1 : 0,
    };
  }
}

class UsersCreateRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  dynamic data;

  UsersCreateRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory UsersCreateRes.fromJson(Map<String, dynamic> json) {
    return UsersCreateRes(
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
