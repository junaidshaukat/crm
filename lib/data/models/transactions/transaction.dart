import '/core/app_export.dart';

class TransactionReq {
  String? currencySymbol;
  String? campaign;
  num fees;

  String amount;
  String? billingPeriod;
  num? campaignTag;
  String? email;
  dynamic noOfRecurring;
  String? userNotes;

  String? cardHolderName;
  String? cardNumber;
  String? ccv;
  String? expiryMonth;
  String? expiryYear;
  bool saveCard;
  String? source;
  String? cardId;
  String? function;

  String? fee;
  String? startDate;

  TransactionReq({
    this.currencySymbol,
    this.campaign,
    this.fees = 0.00,
    this.amount = '0.00',
    this.billingPeriod,
    this.campaignTag,
    this.cardHolderName,
    this.cardNumber,
    this.ccv,
    this.email,
    this.expiryMonth,
    this.expiryYear,
    this.fee,
    this.noOfRecurring,
    this.saveCard = false,
    this.source,
    this.userNotes,
    this.cardId,
    this.function,
    this.startDate,
  });

  Map<String, dynamic> toPrint({Map<String, String>? filter}) {
    final temp = <String, dynamic>{};
    temp['fees'] = fees;
    temp['amount'] = amount;
    temp['saveCard'] = saveCard;

    if (currencySymbol != null) {
      temp['currencySymbol'] = currencySymbol;
    }

    if (campaign != null) {
      temp['campaign'] = campaign;
    }

    if (billingPeriod != null) {
      temp['billingPeriod'] = billingPeriod;
    }

    if (campaignTag != null) {
      temp['campaignTag'] = campaignTag;
    }

    if (cardHolderName != null) {
      temp['cardHolderName'] = cardHolderName;
    }

    if (cardNumber != null) {
      temp['cardNumber'] = cardNumber;
    }

    if (ccv != null) {
      temp['ccv'] = ccv;
    }

    if (email != null) {
      temp['email'] = email;
    }

    if (expiryMonth != null) {
      temp['expiryMonth'] = expiryMonth;
    }

    if (expiryYear != null) {
      temp['expiryYear'] = expiryYear;
    }

    if (fee != null) {
      temp['fee'] = fee;
    }

    if (noOfRecurring != null) {
      temp['noOfRecurring'] = noOfRecurring;
    }

    if (source != null) {
      temp['source'] = source;
    }

    if (userNotes != null) {
      temp['userNotes'] = userNotes;
    }

    if (cardId != null) {
      temp['cardId'] = cardId;
    }

    if (function != null) {
      temp['function'] = function;
    }

    if (startDate != null) {
      temp['startDate'] = startDate;
    }

    return temp;
  }

  Map<String, dynamic> toJson({Map<String, String>? filter}) {
    final temp = <String, dynamic>{};
    temp['amount'] = amount;
    temp['saveCard'] = saveCard;

    if (billingPeriod != null) {
      temp['billingPeriod'] = billingPeriod;
    }

    if (campaignTag != null) {
      temp['campaignTag'] = campaignTag;
    }

    if (cardHolderName != null) {
      temp['cardHolderName'] = cardHolderName;
    }

    if (cardNumber != null) {
      temp['cardNumber'] = cardNumber;
    }

    if (ccv != null) {
      temp['ccv'] = ccv;
    }

    if (email != null) {
      temp['email'] = email;
    }

    if (expiryMonth != null) {
      temp['expiryMonth'] = expiryMonth;
    }

    if (expiryYear != null) {
      temp['expiryYear'] = expiryYear;
    }

    if (fee != null) {
      temp['fee'] = fee;
    }

    if (noOfRecurring != null) {
      temp['noOfRecurring'] = noOfRecurring;
    }

    if (source != null) {
      temp['source'] = source;
    }

    if (userNotes != null) {
      temp['userNotes'] = userNotes;
    }

    if (cardId != null) {
      temp['cardId'] = cardId;
    }

    if (function != null) {
      temp['function'] = function;
    }

    if (startDate != null) {
      temp['startDate'] = startDate;
    }

    return temp;
  }
}

class TransactionRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  TransactionData? data;

  TransactionRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory TransactionRes.fromJson(Map<String, dynamic> json) {
    return TransactionRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data:
          json['data'] != null ? TransactionData.fromJson(json['data']) : null,
    );
  }
}
