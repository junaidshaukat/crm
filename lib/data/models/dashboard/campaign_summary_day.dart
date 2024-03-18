import '/core/app_export.dart';

class CampaignSummaryDayReq {
  List<String>? channelType;
  String? year;
  String? month;
  String? day;

  CampaignSummaryDayReq({this.channelType, this.year, this.month, this.day});

  CampaignSummaryDayReq.fromJson(Map<String, dynamic> json) {
    channelType = json['channelType'];
    year = json['year'];
    month = json['month'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (channelType != null) {
      data['channelType'] = channelType;
    }
    if (year != null) {
      data['year'] = year;
    }
    if (month != null) {
      data['month'] = month;
    }
    if (day != null) {
      data['day'] = day;
    }
    return data;
  }
}

class CampaignSummaryDayRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  CampaignSummary? data;

  CampaignSummaryDayRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  CampaignSummaryDayRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? CampaignSummary.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final temp = <String, dynamic>{};
    if (instanceId != null) {
      temp['instanceId'] = instanceId;
    }
    if (result != null) {
      temp['result'] = result;
    }
    if (message != null) {
      temp['message'] = message;
    }
    if (messageDetails != null) {
      temp['messageDetails'] = messageDetails;
    }
    if (data != null) {
      temp['data'] = data?.toJson();
    }
    return temp;
  }
}
