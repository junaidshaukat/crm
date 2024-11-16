import '/core/app_export.dart';

class EcheckSummaryRes {
  String instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  List<EcheckSummaryData>? data;

  EcheckSummaryRes({
    this.instanceId = '',
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory EcheckSummaryRes.fromJson(Map<String, dynamic> json) {
    return EcheckSummaryRes(
      instanceId: json['instanceId'] ?? '',
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null
          ? List<EcheckSummaryData>.from(
              json['data'].map((x) => EcheckSummaryData.fromJson(x)))
          : null,
    );
  }
}

class EcheckSummaryData {
  num value;
  String label;
  num percentage;
  String description;
  String statusImage;
  String filteredFlag;

  EcheckSummaryData({
    this.value = 0,
    this.label = '',
    this.percentage = 0,
    this.description = '',
    this.statusImage = '',
    this.filteredFlag = '',
  });

  factory EcheckSummaryData.fromJson(Map<String, dynamic> json) {
    return EcheckSummaryData(
      value: json['value'] ?? 0,
      label: json['label'] ?? '',
      percentage: json['percentage'] ?? 0,
      description: json['description'] ?? '',
      statusImage: json['statusImage'] ?? '',
      filteredFlag: json['filteredFlag'] ?? '',
    );
  }
}
