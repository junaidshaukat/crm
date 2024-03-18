import '/core/app_export.dart';

class ResetPasswordReq {
  String? email;
  String? resetCode;
  String? newPassword;
  String? confirmPassword;

  ResetPasswordReq({this.email, this.resetCode, this.newPassword, this.confirmPassword});

  ResetPasswordReq.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    resetCode = json['resetCode'];
    newPassword = json['newPassword'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (email != null) {
      data['email'] = email;
    }
    if (resetCode != null) {
      data['resetCode'] = resetCode;
    }
    if (newPassword != null) {
      data['newPassword'] = newPassword;
    }
    if (confirmPassword != null) {
      data['confirmPassword'] = confirmPassword;
    }
    return data;
  }
}

class ResetPasswordRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  dynamic data;

  ResetPasswordRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  ResetPasswordRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (instanceId != null) {
      data['instanceId'] = instanceId;
    }
    if (result != null) {
      data['result'] = result;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (messageDetails != null) {
      data['messageDetails'] = messageDetails;
    }
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }
}
