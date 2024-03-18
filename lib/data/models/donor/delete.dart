import '/core/app_export.dart';

class DonorDeleteReq {
  String? tagNumber;

  DonorDeleteReq({
    this.tagNumber,
  });

  Map<String, dynamic> toJson() {
    return {'tagNumber': tagNumber};
  }

  String toQueryString() {
    return toJson()
        .entries
        .where((e) => e.value != null)
        .map((e) => '${e.key}=${e.value}')
        .join('&');
  }
}

class DonorDeleteRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  dynamic data;

  DonorDeleteRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory DonorDeleteRes.fromJson(Map<String, dynamic> json) {
    return DonorDeleteRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    final temp = <String, dynamic>{
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'messageDetails': messageDetails,
      'data': data,
    };

    return temp;
  }
}
