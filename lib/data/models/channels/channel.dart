import '/core/app_export.dart';

class ChannelsReq {
  int? page;
  int? pageSize;
  String? order;
  String? by;
  String? type;

  ChannelsReq({
    this.page,
    this.pageSize,
    this.order,
    this.by,
    this.type,
  });

  factory ChannelsReq.fromJson(Map<String, dynamic> json) {
    return ChannelsReq(
      page: json['page'],
      pageSize: json['pageSize'],
      order: json['order'],
      by: json['by'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson({
    Map<String, String>? filter,
    Map<String, List>? query,
  }) {
    final temp = <String, dynamic>{};

    if (page != null) {
      temp['page'] = page;
    }

    if (pageSize != null) {
      temp['pageSize'] = pageSize;
    }

    if (by != null) {
      temp['by'] = by;
    }

    if (type != null) {
      temp['type'] = [type];
    }

    if (order != null) {
      temp['order'] = order;
    }

    if (filter != null) {
      temp.addAll(filter);
    }

    if (query != null) {
      temp.addAll(query);
    }

    return temp;
  }
}

class ChannelsRes {
  String instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  ChannelsLinks? links;
  List<ChannelsData>? data;

  ChannelsRes({
    this.instanceId = '',
    this.result,
    this.message,
    this.messageDetails,
    this.links,
    this.data,
  });

  factory ChannelsRes.fromJson(Map<String, dynamic> json) {
    return ChannelsRes(
      instanceId: json['instanceId'] ?? '',
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      links:
          json['links'] != null ? ChannelsLinks.fromJson(json['links']) : null,
      data: json['data'] != null
          ? List<ChannelsData>.from(
              json['data'].map((x) => ChannelsData.fromJson(x)))
          : null,
    );
  }
}

class ChannelsLinks {
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

  ChannelsLinks({
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

  factory ChannelsLinks.fromJson(Map<String, dynamic> json) {
    return ChannelsLinks(
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
}

class ChannelsData {
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

  ChannelsData({
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

  factory ChannelsData.fromJson(Map<String, dynamic> json) {
    return ChannelsData(
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
