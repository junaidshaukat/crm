import '/core/app_export.dart';

class SetOrganizationReq {
  int? organizationTag;
  SetOrganizationReq({this.organizationTag});

  SetOrganizationReq.fromJson(Map<String, dynamic> json) {
    organizationTag = json['organizationTag'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (organizationTag != null) {
      data['organizationTag'] = organizationTag;
    }
    return data;
  }
}

class SetOrganizationRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  SetOrganization? data;

  SetOrganizationRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  SetOrganizationRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? SetOrganization.fromJson(json['data']) : null;
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

class SetOrganization {
  dynamic data;

  SetOrganization({this.data});

  SetOrganization.fromJson(dynamic json) {
    data = json;
  }

  Map<String, dynamic> toJson() {
    final temp = <String, dynamic>{};
    if (data != null) {
      temp['data'] = data;
    }

    return temp;
  }
}
