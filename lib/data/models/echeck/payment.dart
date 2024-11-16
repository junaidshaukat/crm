import '/core/app_export.dart';

class EcheckPaymentReq {
  int? page;
  String? by;
  String? type;
  int? pageSize;
  String? order;
  String? scheduleStatus;

  EcheckPaymentReq({
    this.by,
    this.page,
    this.type,
    this.order,
    this.pageSize,
    this.scheduleStatus,
  });

  factory EcheckPaymentReq.fromJson(Map<String, dynamic> json) {
    return EcheckPaymentReq(
      by: json['by'],
      page: json['page'],
      type: json['type'],
      order: json['order'],
      pageSize: json['pageSize'],
      scheduleStatus: json['schedule_status[]'],
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

    if (scheduleStatus != null) {
      temp['schedule_status[]'] = scheduleStatus;
    }

    if (query != null) {
      temp.addAll(query);
    }

    return temp;
  }
}

class EcheckPaymentRes {
  bool? result;
  String? message;
  String instanceId;
  EcheckPaymentLinks? links;
  List<EcheckPaymentData>? data;
  MessageDetails? messageDetails;

  EcheckPaymentRes({
    this.data,
    this.links,
    this.result,
    this.message,
    this.messageDetails,
    this.instanceId = '',
  });

  factory EcheckPaymentRes.fromJson(Map<String, dynamic> json) {
    return EcheckPaymentRes(
      result: json['result'],
      message: json['message'],
      instanceId: json['instanceId'] ?? '',
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      links: json['links'] != null
          ? EcheckPaymentLinks.fromJson(json['links'])
          : null,
      data: json['data'] != null
          ? List<EcheckPaymentData>.from(
              json['data'].map((x) => EcheckPaymentData.fromJson(x)))
          : null,
    );
  }
}

class EcheckPaymentLinks {
  num? to;
  num? from;
  num? total;
  num? count;
  num? perPage;
  num? lastPage;
  num? currentPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? firstPageUrl;
  String? previousPageUrl;

  EcheckPaymentLinks({
    this.to,
    this.from,
    this.total,
    this.count,
    this.perPage,
    this.lastPage,
    this.currentPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.firstPageUrl,
    this.previousPageUrl,
  });

  factory EcheckPaymentLinks.fromJson(Map<String, dynamic> json) {
    return EcheckPaymentLinks(
      to: json['to'],
      from: json['from'],
      total: json['total'],
      count: json['count'],
      perPage: json['perPage'],
      lastPage: json['lastPage'],
      currentPage: json['currentPage'],
      lastPageUrl: json['lastPageUrl'],
      nextPageUrl: json['nextPageUrl'],
      firstPageUrl: json['firstPageUrl'],
      previousPageUrl: json['previousPageUrl'],
    );
  }
}

class EcheckPaymentData {
  String? id;
  num? amount;
  num? nodeTag;
  String? email;
  String? notes;
  num? tagNumber;
  String? status;
  String? invoice;
  String? batchId;
  bool? canCancel;
  num? campaignTag;
  String? campaign;
  num? scheduleTag;
  String? startDate;
  String? createdBy;
  String? stateName;
  num? totalPayments;
  String? statusText;
  num? chargedAmount;
  String? statusName;
  String? returnType;
  String? returnDate;
  String? nextBilling;
  String? accountCode;
  String? processDate;
  num? transactionTag;
  num? processedNumber;
  String? responseCode;
  String? billingPeriod;
  String? billingExpiry;
  String? instituteName;
  String? transitNumber;
  String? accountNumber;
  String? transactionId;
  String? currencySymbol;
  String? createDateTime;
  String? updateDateTime;
  String? scheduleStatus;
  String? lastStatusDate;
  String? settlementDate;
  String? instituteNumber;
  String? responseMessage;
  String? accountHolderName;
  num? campaignMinimumAmount;
  String? scheduleStatusText;
  String? originalProcessDate;
  String? scheduleStatusImage;

  EcheckPaymentData({
    this.id,
    this.email,
    this.notes,
    this.amount,
    this.status,
    this.nodeTag,
    this.invoice,
    this.batchId,
    this.campaign,
    this.tagNumber,
    this.startDate,
    this.createdBy,
    this.stateName,
    this.canCancel,
    this.statusText,
    this.statusName,
    this.returnType,
    this.returnDate,
    this.campaignTag,
    this.nextBilling,
    this.accountCode,
    this.scheduleTag,
    this.processDate,
    this.responseCode,
    this.billingPeriod,
    this.totalPayments,
    this.billingExpiry,
    this.instituteName,
    this.transitNumber,
    this.accountNumber,
    this.chargedAmount,
    this.transactionId,
    this.currencySymbol,
    this.createDateTime,
    this.updateDateTime,
    this.scheduleStatus,
    this.lastStatusDate,
    this.settlementDate,
    this.transactionTag,
    this.processedNumber,
    this.instituteNumber,
    this.responseMessage,
    this.accountHolderName,
    this.scheduleStatusText,
    this.originalProcessDate,
    this.scheduleStatusImage,
    this.campaignMinimumAmount,
  });

  factory EcheckPaymentData.fromJson(Map<String, dynamic> json) {
    return EcheckPaymentData(
      id: json['id'],
      email: json['email'],
      notes: json['notes'],
      amount: json['amount'],
      status: json['status'],
      nodeTag: json['nodeTag'],
      invoice: json['invoice'],
      batchId: json['batchId'],
      campaign: json['campaign'],
      tagNumber: json['tagNumber'],
      startDate: json['startDate'],
      createdBy: json['createdBy'],
      stateName: json['stateName'],
      canCancel: json['canCancel'],
      statusText: json['statusText'],
      statusName: json['statusName'],
      returnType: json['returnType'],
      returnDate: json['returnDate'],
      campaignTag: json['campaignTag'],
      nextBilling: json['nextBilling'],
      accountCode: json['accountCode'],
      scheduleTag: json['scheduleTag'],
      processDate: json['processDate'],
      responseCode: json['responseCode'],
      billingPeriod: json['billingPeriod'],
      totalPayments: json['totalPayments'],
      billingExpiry: json['billingExpiry'],
      instituteName: json['instituteName'],
      transitNumber: json['transitNumber'],
      accountNumber: json['accountNumber'],
      chargedAmount: json['chargedAmount'],
      transactionId: json['transactionId'],
      currencySymbol: json['currencySymbol'],
      createDateTime: json['createDateTime'],
      updateDateTime: json['updateDateTime'],
      scheduleStatus: json['scheduleStatus'],
      lastStatusDate: json['lastStatusDate'],
      settlementDate: json['settlementDate'],
      transactionTag: json['transactionTag'],
      processedNumber: json['processedNumber'],
      instituteNumber: json['instituteNumber'],
      responseMessage: json['responseMessage'],
      accountHolderName: json['accountHolderName'],
      scheduleStatusText: json['scheduleStatusText'],
      originalProcessDate: json['originalProcessDate'],
      scheduleStatusImage: json['scheduleStatusImage'],
      campaignMinimumAmount: json['campaignMinimumAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'notes': notes,
      'amount': amount,
      'status': status,
      'nodeTag': nodeTag,
      'invoice': invoice,
      'batchId': batchId,
      'campaign': campaign,
      'tagNumber': tagNumber,
      'startDate': startDate,
      'createdBy': createdBy,
      'stateName': stateName,
      'canCancel': canCancel,
      'statusText': statusText,
      'statusName': statusName,
      'returnType': returnType,
      'returnDate': returnDate,
      'campaignTag': campaignTag,
      'nextBilling': nextBilling,
      'accountCode': accountCode,
      'scheduleTag': scheduleTag,
      'processDate': processDate,
      'responseCode': responseCode,
      'billingPeriod': billingPeriod,
      'totalPayments': totalPayments,
      'billingExpiry': billingExpiry,
      'instituteName': instituteName,
      'transitNumber': transitNumber,
      'accountNumber': accountNumber,
      'chargedAmount': chargedAmount,
      'transactionId': transactionId,
      'currencySymbol': currencySymbol,
      'createDateTime': createDateTime,
      'updateDateTime': updateDateTime,
      'scheduleStatus': scheduleStatus,
      'lastStatusDate': lastStatusDate,
      'settlementDate': settlementDate,
      'transactionTag': transactionTag,
      'processedNumber': processedNumber,
      'instituteNumber': instituteNumber,
      'responseMessage': responseMessage,
      'accountHolderName': accountHolderName,
      'scheduleStatusText': scheduleStatusText,
      'originalProcessDate': originalProcessDate,
      'scheduleStatusImage': scheduleStatusImage,
      'campaignMinimumAmount': campaignMinimumAmount,
    };
  }
}
