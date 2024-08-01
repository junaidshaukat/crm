import '/core/app_export.dart';

class TransactionsReq {
  num? page;
  num? pageSize;
  String? by;
  String? order;

  TransactionsReq({
    this.page = 1,
    this.pageSize = 20,
    this.by,
    this.order,
  });

  Map<String, dynamic> toJson(
      {Map<String, String>? filter, Map<String, List>? query}) {
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

  String toQueryString() {
    return toJson()
        .entries
        .where((e) => e.value != null)
        .map((e) => '${e.key}=${e.value}')
        .join('&');
  }
}

class TransactionsRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  TransactionLinks? links;
  TransactionData? data;

  TransactionsRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.links,
    this.data,
  });

  factory TransactionsRes.fromJson(Map<String, dynamic> json) {
    return TransactionsRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      links: json['links'] != null
          ? TransactionLinks.fromJson(json['links'])
          : null,
      data:
          json['data'] != null ? TransactionData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'messageDetails': messageDetails,
      'links': links?.toJson(),
      'data': data?.toJson(),
    };
  }
}

class TransactionLinks {
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

  TransactionLinks({
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

  factory TransactionLinks.fromJson(Map<String, dynamic> json) {
    return TransactionLinks(
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

class TransactionData {
  String? currencySymbol;
  List<Transaction>? transactions;

  TransactionData({
    this.currencySymbol,
    this.transactions,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      currencySymbol: json['currencySymbol'],
      transactions: json['transactions'] != null
          ? List<Transaction>.from(
              json['transactions'].map((x) => Transaction.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currencySymbol': currencySymbol,
      'transactions': transactions?.map((e) => e.toJson()).toList(),
    };
  }
}

class Transaction {
  num? fee;
  int? nodeTag;
  Donor? donor;
  String? email;
  dynamic notes;
  bool? canEdit;
  String? invoice;
  bool? canRefund;
  bool? canDelete;
  String? nodeName;
  String? nodeType;
  int? campaignTag;
  String? campaign;
  String? cardType;
  dynamic firstSix;
  String? cardBrand;
  String? cardImage;
  String? entryMode;
  dynamic userNotes;
  String? startDate;
  bool? taxDeductible;
  int? transactionTag;
  num? approvedAmount;
  String? cardAccount;
  dynamic batchNumber;
  int? organizationTag;
  String? approvalCode;
  String? responseCode;
  String? campaignImage;
  String? cardIssueCode;
  String? sequenceNumber;
  String? entryModeImage;
  bool? taxReceiptIssued;
  dynamic taxReceiptDate;
  dynamic cardholderName;
  String? createDatetime;
  String? updateDatetime;
  String? transactionDate;
  String? paymentProcessor;
  dynamic recurringPayment;
  String? taxDeductibleImage;
  dynamic applicationIdentifier;
  dynamic transactionCryptogram;
  dynamic terminalStatusIndicator;
  dynamic terminalVerificationResults;

  Transaction({
    this.fee,
    this.email,
    this.notes,
    this.donor,
    this.nodeTag,
    this.invoice,
    this.canEdit,
    this.nodeName,
    this.nodeType,
    this.campaign,
    this.cardType,
    this.firstSix,
    this.cardBrand,
    this.cardImage,
    this.entryMode,
    this.userNotes,
    this.canDelete,
    this.canRefund,
    this.startDate,
    this.campaignTag,
    this.cardAccount,
    this.batchNumber,
    this.approvalCode,
    this.responseCode,
    this.campaignImage,
    this.taxDeductible,
    this.cardIssueCode,
    this.transactionTag,
    this.approvedAmount,
    this.sequenceNumber,
    this.entryModeImage,
    this.taxReceiptDate,
    this.cardholderName,
    this.createDatetime,
    this.updateDatetime,
    this.organizationTag,
    this.transactionDate,
    this.paymentProcessor,
    this.taxReceiptIssued,
    this.recurringPayment,
    this.taxDeductibleImage,
    this.applicationIdentifier,
    this.transactionCryptogram,
    this.terminalStatusIndicator,
    this.terminalVerificationResults,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      fee: json['fee'],
      email: json['email'],
      notes: json['notes'],
      nodeTag: json['nodeTag'],
      invoice: json['invoice'],
      canEdit: json['canEdit'],
      nodeName: json['nodeName'],
      nodeType: json['nodeType'],
      campaign: json['campaign'],
      cardType: json['cardType'],
      firstSix: json['firstSix'],
      cardBrand: json['cardBrand'],
      cardImage: json['cardImage'],
      entryMode: json['entryMode'],
      userNotes: json['userNotes'],
      canDelete: json['canDelete'],
      canRefund: json['canRefund'],
      startDate: json['startDate'],
      campaignTag: json['campaignTag'],
      cardAccount: json['cardAccount'],
      batchNumber: json['batchNumber'],
      approvalCode: json['approvalCode'],
      responseCode: json['responseCode'],
      campaignImage: json['campaignImage'],
      taxDeductible: json['taxDeductible'],
      cardIssueCode: json['cardIssueCode'],
      transactionTag: json['transactionTag'],
      approvedAmount: json['approvedAmount'],
      sequenceNumber: json['sequenceNumber'],
      entryModeImage: json['entryModeImage'],
      taxReceiptDate: json['taxReceiptDate'],
      cardholderName: json['cardholderName'],
      createDatetime: json['createDatetime'],
      updateDatetime: json['updateDatetime'],
      organizationTag: json['organizationTag'],
      transactionDate: json['transactionDate'],
      paymentProcessor: json['paymentProcessor'],
      taxReceiptIssued: json['taxReceiptIssued'],
      recurringPayment: json['recurringPayment'],
      taxDeductibleImage: json['taxDeductibleImage'],
      applicationIdentifier: json['applicationIdentifier'],
      transactionCryptogram: json['transactionCryptogram'],
      terminalStatusIndicator: json['terminalStatusIndicator'],
      terminalVerificationResults: json['terminalVerificationResults'],
      donor: json['donor'] != null ? Donor.fromJson(json['donor']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fee': fee,
      'email': email,
      'notes': notes,
      'nodeTag': nodeTag,
      'invoice': invoice,
      'canEdit': canEdit,
      'nodeName': nodeName,
      'nodeType': nodeType,
      'campaign': campaign,
      'cardType': cardType,
      'firstSix': firstSix,
      'cardBrand': cardBrand,
      'cardImage': cardImage,
      'entryMode': entryMode,
      'userNotes': userNotes,
      'canDelete': canDelete,
      'canRefund': canRefund,
      'startDate': startDate,
      'donor': donor?.toJson(),
      'campaignTag': campaignTag,
      'cardAccount': cardAccount,
      'batchNumber': batchNumber,
      'approvalCode': approvalCode,
      'responseCode': responseCode,
      'campaignImage': campaignImage,
      'taxDeductible': taxDeductible,
      'cardIssueCode': cardIssueCode,
      'transactionTag': transactionTag,
      'approvedAmount': approvedAmount,
      'sequenceNumber': sequenceNumber,
      'entryModeImage': entryModeImage,
      'taxReceiptDate': taxReceiptDate,
      'cardholderName': cardholderName,
      'createDatetime': createDatetime,
      'updateDatetime': updateDatetime,
      'organizationTag': organizationTag,
      'transactionDate': transactionDate,
      'paymentProcessor': paymentProcessor,
      'taxReceiptIssued': taxReceiptIssued,
      'recurringPayment': recurringPayment,
      'taxDeductibleImage': taxDeductibleImage,
      'applicationIdentifier': applicationIdentifier,
      'transactionCryptogram': transactionCryptogram,
      'terminalStatusIndicator': terminalStatusIndicator,
      'terminalVerificationResults': terminalVerificationResults,
    };
  }
}

class Donor {
  int? tagNumber;
  String? firstName;
  String? middleName;
  String? lastName;
  String? streetAddress;
  dynamic unitNumber;
  String? city;
  String? postalZipCode;
  String? provinceState;
  String? country;
  String? email;
  String? phone;
  int? status;
  dynamic lastLogin;
  int? allowContact;
  int? notifyNewCampaign;
  String? createDateTime;
  String? updateDateTime;

  Donor({
    this.tagNumber,
    this.firstName,
    this.middleName,
    this.lastName,
    this.streetAddress,
    this.unitNumber,
    this.city,
    this.postalZipCode,
    this.provinceState,
    this.country,
    this.email,
    this.phone,
    this.status,
    this.lastLogin,
    this.allowContact,
    this.notifyNewCampaign,
    this.createDateTime,
    this.updateDateTime,
  });

  factory Donor.fromJson(Map<String, dynamic> json) {
    return Donor(
      tagNumber: json['tagNumber'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      streetAddress: json['streetAddress'],
      unitNumber: json['unitNumber'],
      city: json['city'],
      postalZipCode: json['postalZipCode'],
      provinceState: json['provinceState'],
      country: json['country'],
      email: json['email'],
      phone: json['phone'],
      status: json['status'],
      lastLogin: json['lastLogin'],
      allowContact: json['allowContact'],
      notifyNewCampaign: json['notifyNewCampaign'],
      createDateTime: json['createDateTime'],
      updateDateTime: json['updateDateTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tagNumber': tagNumber,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'streetAddress': streetAddress,
      'unitNumber': unitNumber,
      'city': city,
      'postalZipCode': postalZipCode,
      'provinceState': provinceState,
      'country': country,
      'email': email,
      'phone': phone,
      'status': status,
      'lastLogin': lastLogin,
      'allowContact': allowContact,
      'notifyNewCampaign': notifyNewCampaign,
      'createDateTime': createDateTime,
      'updateDateTime': updateDateTime,
    };
  }
}
