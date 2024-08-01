import '/core/app_export.dart';

class RecentTransactionsReq {
  String? email;
  String? n;

  RecentTransactionsReq({
    this.email,
    this.n,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'n': n};
  }

  String toQueryString() {
    return toJson()
        .entries
        .where((e) => e.value != null)
        .map((e) => '${e.key}=${e.value}')
        .join('&');
  }
}

class RecentTransactionsRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  RecentTransactions? data;

  RecentTransactionsRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory RecentTransactionsRes.fromJson(Map<String, dynamic> json) {
    return RecentTransactionsRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null
          ? RecentTransactions.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final temp = <String, dynamic>{
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'messageDetails': messageDetails,
      'data': data?.toJson(),
    };

    return temp;
  }
}

class RecentTransactions {
  final String? currencySymbol;
  final List<Transactions>? transactions;

  RecentTransactions({
    this.currencySymbol,
    this.transactions,
  });

  factory RecentTransactions.fromJson(Map<String, dynamic> json) {
    return RecentTransactions(
      currencySymbol: json['currencySymbol'],
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((item) => Transactions.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currencySymbol': currencySymbol,
      'transactions': transactions?.map((item) => item.toJson()).toList(),
    };
  }
}

class Transactions {
  int? tagNumber;
  String? nodeName;
  String? nodeType;
  int? campaignTag;
  String? campaign;
  String? campaignLogo;
  num? approvedAmount;
  String? cardBrand;
  String? cardType;
  String? cardImage;
  String? transactionDate;
  bool? taxDeductible;
  String? taxDeductibleImage;
  String? taxReceiptDate;

  Transactions({
    this.tagNumber,
    this.nodeName,
    this.nodeType,
    this.campaignTag,
    this.campaign,
    this.campaignLogo,
    this.approvedAmount,
    this.cardBrand,
    this.cardType,
    this.cardImage,
    this.transactionDate,
    this.taxDeductible,
    this.taxDeductibleImage,
    this.taxReceiptDate,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      tagNumber: json['tagNumber'],
      nodeName: json['nodeName'],
      nodeType: json['nodeType'],
      campaignTag: json['campaignTag'],
      campaign: json['campaign'],
      campaignLogo: json['campaignLogo'],
      approvedAmount: json['approvedAmount'],
      cardBrand: json['cardBrand'],
      cardType: json['cardType'],
      cardImage: json['cardImage'],
      transactionDate: json['transactionDate'],
      taxDeductible: json['taxDeductible'],
      taxDeductibleImage: json['taxDeductibleImage'],
      taxReceiptDate: json['taxReceiptDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tagNumber': tagNumber,
      'nodeName': nodeName,
      'nodeType': nodeType,
      'campaignTag': campaignTag,
      'campaign': campaign,
      'campaignLogo': campaignLogo,
      'approvedAmount': approvedAmount,
      'cardBrand': cardBrand,
      'cardType': cardType,
      'cardImage': cardImage,
      'transactionDate': transactionDate,
      'taxDeductible': taxDeductible,
      'taxDeductibleImage': taxDeductibleImage,
      'taxReceiptDate': taxReceiptDate,
    };
  }
}
