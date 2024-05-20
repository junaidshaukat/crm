import '/core/app_export.dart';

class RecognizedCardReq {
  List<String>? texts;

  RecognizedCardReq({this.texts});

  RecognizedCardReq.fromJson(Map<String, dynamic> json) {
    texts = json['texts'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (texts != null) {
      data['texts'] = texts;
    }
    return data;
  }
}

class RecognizedCardRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  CardData? data;

  RecognizedCardRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  RecognizedCardRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? CardData.fromJson(json['data']) : null;
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

class CardData {
  String? firstName;

  CardData({
    this.firstName,
  });

  CardData.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (firstName != null) {
      data['firstName'] = firstName;
    }

    return data;
  }
}
