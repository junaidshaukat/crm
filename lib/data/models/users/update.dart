import '/core/app_export.dart';

class UsersUpdateReq {
  String? requestType;
  String? email;
  String? accountPassword;
  String? firstName;
  String? lastName;
  String? language;
  String? role;
  num? status;

  UsersUpdateReq({
    this.requestType = "update",
    this.email,
    this.accountPassword,
    this.firstName,
    this.lastName,
    this.language,
    this.role,
    this.status,
  });

  factory UsersUpdateReq.fromJson(Map<String, dynamic> json) {
    return UsersUpdateReq(
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
    Map<String, dynamic> data = {};
    if (requestType != null) {
      data['requestType'] = requestType;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (accountPassword != null && accountPassword!.trim().isNotEmpty) {
      data['accountPassword'] = accountPassword;
    }
    if (firstName != null) {
      data['firstName'] = firstName;
    }
    if (lastName != null) {
      data['lastName'] = lastName;
    }
    if (language != null) {
      data['language'] = language;
    }
    if (role != null) {
      data['role'] = role;
    }
    if (status != null) {
      data['status'] = status;
    }
    return data;
  }
}

class UsersUpdateRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  dynamic data;

  UsersUpdateRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory UsersUpdateRes.fromJson(Map<String, dynamic> json) {
    return UsersUpdateRes(
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
