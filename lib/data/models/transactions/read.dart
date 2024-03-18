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
  int? organizationTag;
  int? nodeTag;
  String? nodeName;
  String? nodeType;
  String? paymentProcessor;
  int? campaignTag;
  String? campaign;
  String? campaignImage;
  bool? taxDeductible;
  int? transactionTag;
  String? invoice;
  num? approvedAmount;
  num? fee;
  String? email;
  String? cardAccount;
  String? cardIssueCode;
  String? approvalCode;
  String? responseCode;
  String? sequenceNumber;
  String? cardType;
  String? cardBrand;
  String? cardImage;
  String? entryMode;
  String? entryModeImage;
  String? transactionDate;
  dynamic batchNumber;
  dynamic applicationIdentifier;
  dynamic transactionCryptogram;
  dynamic terminalVerificationResults;
  dynamic terminalStatusIndicator;
  dynamic notes;
  dynamic userNotes;
  String? taxDeductibleImage;
  bool? taxReceiptIssued;
  dynamic taxReceiptDate;
  dynamic firstSix;
  dynamic cardholderName;
  Donor? donor;
  bool? canEdit;
  bool? canDelete;
  String? createDatetime;
  String? updateDatetime;
  dynamic recurringPayment;

  Transaction({
    this.organizationTag,
    this.nodeTag,
    this.nodeName,
    this.nodeType,
    this.paymentProcessor,
    this.campaignTag,
    this.campaign,
    this.campaignImage,
    this.taxDeductible,
    this.transactionTag,
    this.invoice,
    this.approvedAmount,
    this.fee,
    this.email,
    this.cardAccount,
    this.cardIssueCode,
    this.approvalCode,
    this.responseCode,
    this.sequenceNumber,
    this.cardType,
    this.cardBrand,
    this.cardImage,
    this.entryMode,
    this.entryModeImage,
    this.transactionDate,
    this.batchNumber,
    this.applicationIdentifier,
    this.transactionCryptogram,
    this.terminalVerificationResults,
    this.terminalStatusIndicator,
    this.notes,
    this.userNotes,
    this.taxDeductibleImage,
    this.taxReceiptIssued,
    this.taxReceiptDate,
    this.firstSix,
    this.cardholderName,
    this.donor,
    this.canEdit,
    this.canDelete,
    this.createDatetime,
    this.updateDatetime,
    this.recurringPayment,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      organizationTag: json['organizationTag'],
      nodeTag: json['nodeTag'],
      nodeName: json['nodeName'],
      nodeType: json['nodeType'],
      paymentProcessor: json['paymentProcessor'],
      campaignTag: json['campaignTag'],
      campaign: json['campaign'],
      campaignImage: json['campaignImage'],
      taxDeductible: json['taxDeductible'],
      transactionTag: json['transactionTag'],
      invoice: json['invoice'],
      approvedAmount: json['approvedAmount'],
      fee: json['fee'],
      email: json['email'],
      cardAccount: json['cardAccount'],
      cardIssueCode: json['cardIssueCode'],
      approvalCode: json['approvalCode'],
      responseCode: json['responseCode'],
      sequenceNumber: json['sequenceNumber'],
      cardType: json['cardType'],
      cardBrand: json['cardBrand'],
      cardImage: json['cardImage'],
      entryMode: json['entryMode'],
      entryModeImage: json['entryModeImage'],
      transactionDate: json['transactionDate'],
      batchNumber: json['batchNumber'],
      applicationIdentifier: json['applicationIdentifier'],
      transactionCryptogram: json['transactionCryptogram'],
      terminalVerificationResults: json['terminalVerificationResults'],
      terminalStatusIndicator: json['terminalStatusIndicator'],
      notes: json['notes'],
      userNotes: json['userNotes'],
      taxDeductibleImage: json['taxDeductibleImage'],
      taxReceiptIssued: json['taxReceiptIssued'],
      taxReceiptDate: json['taxReceiptDate'],
      firstSix: json['firstSix'],
      cardholderName: json['cardholderName'],
      donor: json['donor'] != null ? Donor.fromJson(json['donor']) : null,
      canEdit: json['canEdit'],
      canDelete: json['canDelete'],
      createDatetime: json['createDatetime'],
      updateDatetime: json['updateDatetime'],
      recurringPayment: json['recurringPayment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'organizationTag': organizationTag,
      'nodeTag': nodeTag,
      'nodeName': nodeName,
      'nodeType': nodeType,
      'paymentProcessor': paymentProcessor,
      'campaignTag': campaignTag,
      'campaign': campaign,
      'campaignImage': campaignImage,
      'taxDeductible': taxDeductible,
      'transactionTag': transactionTag,
      'invoice': invoice,
      'approvedAmount': approvedAmount,
      'fee': fee,
      'email': email,
      'cardAccount': cardAccount,
      'cardIssueCode': cardIssueCode,
      'approvalCode': approvalCode,
      'responseCode': responseCode,
      'sequenceNumber': sequenceNumber,
      'cardType': cardType,
      'cardBrand': cardBrand,
      'cardImage': cardImage,
      'entryMode': entryMode,
      'entryModeImage': entryModeImage,
      'transactionDate': transactionDate,
      'batchNumber': batchNumber,
      'applicationIdentifier': applicationIdentifier,
      'transactionCryptogram': transactionCryptogram,
      'terminalVerificationResults': terminalVerificationResults,
      'terminalStatusIndicator': terminalStatusIndicator,
      'notes': notes,
      'userNotes': userNotes,
      'taxDeductibleImage': taxDeductibleImage,
      'taxReceiptIssued': taxReceiptIssued,
      'taxReceiptDate': taxReceiptDate,
      'firstSix': firstSix,
      'cardholderName': cardholderName,
      'donor': donor?.toJson(),
      'canEdit': canEdit,
      'canDelete': canDelete,
      'createDatetime': createDatetime,
      'updateDatetime': updateDatetime,
      'recurringPayment': recurringPayment,
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
