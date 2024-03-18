import '/core/app_export.dart';

class CampaignSummaryMonthReq {
  List<String>? channelType;
  String? year;
  String? month;

  CampaignSummaryMonthReq({this.channelType, this.year, this.month});

  CampaignSummaryMonthReq.fromJson(Map<String, dynamic> json) {
    channelType = json['channelType'];
    year = json['year'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (channelType != null) {
      data['channelType'] = channelType;
    }
    if (channelType != null) {
      data['year'] = year;
    }
    if (channelType != null) {
      data['month'] = month;
    }
    return data;
  }
}

class CampaignSummaryMonthRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  CampaignSummary? data;

  CampaignSummaryMonthRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  CampaignSummaryMonthRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? CampaignSummary.fromJson(json['data']) : null;
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
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}
