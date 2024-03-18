import '/core/app_export.dart';

class CampaignSummaryYearReq {
  List<String>? channelType;
  String? year;

  CampaignSummaryYearReq({this.channelType, this.year});

  CampaignSummaryYearReq.fromJson(Map<String, dynamic> json) {
    channelType = json['channelType'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (channelType != null) {
      data['channelType'] = channelType;
    }
    if (year != null) {
      data['year'] = year;
    }
    return data;
  }
}

class CampaignSummaryYearRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  CampaignSummary? data;

  CampaignSummaryYearRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  CampaignSummaryYearRes.fromJson(Map<String, dynamic> json) {
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
