import '/core/app_export.dart';

class ChannelUpdateReq {
  String? organizationDefinedName;

  ChannelUpdateReq({
    this.organizationDefinedName,
  });

  factory ChannelUpdateReq.fromJson(Map<String, dynamic> json) {
    return ChannelUpdateReq(
      organizationDefinedName: json['organizationDefinedName'],
    );
  }

  Map<String, dynamic> toJson() {
    final temp = <String, dynamic>{};

    if (organizationDefinedName != null) {
      temp['organizationDefinedName'] = organizationDefinedName;
    }

    return temp;
  }
}

class ChannelUpdateRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  ChannelUpdateData? data;

  ChannelUpdateRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory ChannelUpdateRes.fromJson(Map<String, dynamic> json) {
    return ChannelUpdateRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: ChannelUpdateData.fromJson(json['data']),
    );
  }
}

class ChannelUpdateData {
  int? tagNumber;
  String? organizationDefinedName;
  String? type;
  String? userName;
  String? paymentProcessor;
  String? passcode;
  String? serialNumber;
  String? installDate;
  bool? status;
  String? model;
  String? modelImage;
  String? raisedAmount;
  String? currencySymbol;

  ChannelUpdateData({
    this.tagNumber,
    this.organizationDefinedName,
    this.type,
    this.userName,
    this.paymentProcessor,
    this.passcode,
    this.serialNumber,
    this.installDate,
    this.status,
    this.model,
    this.modelImage,
    this.raisedAmount,
    this.currencySymbol,
  });

  factory ChannelUpdateData.fromJson(Map<String, dynamic> json) {
    return ChannelUpdateData(
      tagNumber: json['tagNumber'],
      organizationDefinedName: json['organizationDefinedName'],
      type: json['type'],
      userName: json['userName'],
      paymentProcessor: json['paymentProcessor'],
      passcode: json['passcode'],
      serialNumber: json['serialNumber'],
      installDate: json['installDate'],
      status: json['status'],
      model: json['model'],
      modelImage: json['modelImage'],
      raisedAmount: json['raisedAmount'],
      currencySymbol: json['currencySymbol'],
    );
  }
}
