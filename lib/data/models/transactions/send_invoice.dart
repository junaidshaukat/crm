import '/core/app_export.dart';

class SendInvoiceReq {
  num? tagNumber;

  SendInvoiceReq({this.tagNumber});

  Map<String, dynamic> toJson({Map<String, String>? filter}) {
    final temp = <String, dynamic>{};

    if (tagNumber != null) {
      temp['tagNumber'] = tagNumber;
    }

    return temp;
  }
}

class SendInvoiceRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  dynamic data;

  SendInvoiceRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory SendInvoiceRes.fromJson(Map<String, dynamic> json) {
    return SendInvoiceRes(
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
