import '/core/app_export.dart';

class MediaDeleteRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  dynamic data;

  MediaDeleteRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory MediaDeleteRes.fromJson(Map<String, dynamic> json) {
    return MediaDeleteRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'],
    );
  }
}
