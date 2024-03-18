import '/core/app_export.dart';

class ChannelReadReq {
  String? pageSize;
  String? organizationDefinedName;
  String? type;
  List<String>? paymentProcessor;
  String? serialNumber;
  List<String>? status;
  String? by;
  String? order;

  ChannelReadReq({
    this.pageSize,
    this.organizationDefinedName,
    this.type,
    this.paymentProcessor,
    this.serialNumber,
    this.status,
    this.by,
    this.order,
  });

  factory ChannelReadReq.fromJson(Map<String, dynamic> json) {
    return ChannelReadReq(
      pageSize: json['pageSize'],
      organizationDefinedName: json['organization_defined_name'],
      type: json['type'],
      paymentProcessor: json['payment_processor'],
      serialNumber: json['serial_number'],
      status: json['status'],
      by: json['by'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageSize': pageSize,
      'organization_defined_name': organizationDefinedName,
      'type': type,
      'payment_processor': paymentProcessor,
      'serial_number': serialNumber,
      'status': status,
      'by': by,
      'order': order,
    };
  }
}

class ChannelReadRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  ChannelLinks? links;
  List<ChannelData>? data;

  ChannelReadRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.links,
    this.data,
  });

  factory ChannelReadRes.fromJson(Map<String, dynamic> json) {
    return ChannelReadRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      links:
          json['links'] != null ? ChannelLinks.fromJson(json['links']) : null,
      data: json['data'] != null
          ? (json['data'] as List<dynamic>)
              .map((data) => ChannelData.fromJson(data))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'messageDetails': messageDetails,
      'links': links?.toJson(),
      'data': data?.map((data) => data.toJson()).toList(),
    };
  }
}

class ChannelLinks {
  num? total;
  num? count;
  num? perPage;
  num? currentPage;
  num? lastPage;
  String? firstPageUrl;
  String? lastPageUrl;
  String? nextPageUrl;
  String? previousPageUrl;
  num? from;
  num? to;

  ChannelLinks({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.previousPageUrl,
    this.from,
    this.to,
  });

  factory ChannelLinks.fromJson(Map<String, dynamic> json) {
    return ChannelLinks(
      total: json['total'],
      count: json['count'],
      perPage: json['perPage'],
      currentPage: json['currentPage'],
      lastPage: json['lastPage'],
      firstPageUrl: json['firstPageUrl'],
      lastPageUrl: json['lastPageUrl'],
      nextPageUrl: json['nextPageUrl'],
      previousPageUrl: json['previousPageUrl'],
      from: json['from'],
      to: json['to'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'count': count,
      'perPage': perPage,
      'currentPage': currentPage,
      'lastPage': lastPage,
      'firstPageUrl': firstPageUrl,
      'lastPageUrl': lastPageUrl,
      'nextPageUrl': nextPageUrl,
      'previousPageUrl': previousPageUrl,
      'from': from,
      'to': to,
    };
  }
}

class ChannelData {
  num? tagNumber;
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

  ChannelData({
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

  factory ChannelData.fromJson(Map<String, dynamic> json) {
    return ChannelData(
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

  Map<String, dynamic> toJson() {
    return {
      'tagNumber': tagNumber,
      'organizationDefinedName': organizationDefinedName,
      'type': type,
      'userName': userName,
      'paymentProcessor': paymentProcessor,
      'passcode': passcode,
      'serialNumber': serialNumber,
      'installDate': installDate,
      'status': status,
      'model': model,
      'modelImage': modelImage,
      'raisedAmount': raisedAmount,
      'currencySymbol': currencySymbol,
    };
  }
}
