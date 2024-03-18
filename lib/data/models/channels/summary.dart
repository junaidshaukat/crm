import '/core/app_export.dart';

class ChannelSummaryRes {
  String instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  List<ChannelSummaryData>? data;

  ChannelSummaryRes({
    this.instanceId = '',
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory ChannelSummaryRes.fromJson(Map<String, dynamic> json) {
    return ChannelSummaryRes(
      instanceId: json['instanceId'] ?? '',
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null ? List<ChannelSummaryData>.from(json['data'].map((x) => ChannelSummaryData.fromJson(x))) : null,
    );
  }
}

class ChannelSummaryData {
  String label;
  String filteredFlag;
  num value;
  String image;

  ChannelSummaryData({
    this.label = '',
    this.filteredFlag = '',
    this.value = 0,
    this.image = '',
  });

  factory ChannelSummaryData.fromJson(Map<String, dynamic> json) {
    return ChannelSummaryData(
      label: json['label'] ?? '',
      filteredFlag: json['filteredFlag'] ?? '',
      value: json['value'] ?? 0,
      image: json['image'] ?? '',
    );
  }
}
