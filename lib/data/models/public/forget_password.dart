import '/core/app_export.dart';

class ForgetPasswordReq {
  String? email;
  String? codeType;

  ForgetPasswordReq({this.email, this.codeType = "digits"});

  ForgetPasswordReq.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    codeType = json['codeType'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (email != null) {
      data['email'] = email;
    }
    if (codeType != null) {
      data['codeType'] = codeType;
    }
    return data;
  }
}

class ForgetPasswordRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  List? data;

  ForgetPasswordRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  ForgetPasswordRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(v);
      });
    }
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
      data['data'] = this.data?.map((v) => v).toList();
    }
    return data;
  }
}
