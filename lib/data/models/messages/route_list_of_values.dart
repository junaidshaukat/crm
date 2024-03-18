//routeLov

import '/core/app_export.dart';

class RouteLovReq {
  String? routeName;

  RouteLovReq({
    this.routeName,
  });

  factory RouteLovReq.fromJson(Map<String, dynamic> json) {
    return RouteLovReq(
      routeName: json['routeName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'routeName': routeName,
    };
  }
}

class RouteLovRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  dynamic data;

  RouteLovRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory RouteLovRes.fromJson(Map<String, dynamic> json) {
    return RouteLovRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['instanceId'] = instanceId;
    json['result'] = result;
    json['message'] = message;
    json['messageDetails'] = messageDetails;
    json['data'] = data;
    return json;
  }
}
