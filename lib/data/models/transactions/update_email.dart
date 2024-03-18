import '/core/app_export.dart';

class UpdateEmailReq {
  num? tagNumber;
  String? email;

  UpdateEmailReq({this.tagNumber, this.email});

  Map<String, dynamic> toJson({Map<String, String>? filter}) {
    final temp = <String, dynamic>{};

    if (tagNumber != null) {
      temp['tagNumber'] = tagNumber;
    }

    if (email != null) {
      temp['email'] = email;
    }

    return temp;
  }
}

class UpdateEmailRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  Transaction? data;

  UpdateEmailRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory UpdateEmailRes.fromJson(Map<String, dynamic> json) {
    return UpdateEmailRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null ? Transaction.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['instanceId'] = instanceId;
    data['result'] = result;
    data['message'] = message;
    data['messageDetails'] = messageDetails;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
