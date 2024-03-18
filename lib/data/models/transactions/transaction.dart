import '/core/app_export.dart';

class TransactionReq {
  String? amount;
  String? billingPeriod;
  num? campaignTag;
  String? cardHolderName;
  String? cardNumber;
  String? ccv;
  String? email;
  String? expiryMonth;
  String? expiryYear;
  String? fee;
  dynamic noOfRecurring;
  bool? saveCard;
  String? source;
  String? userNotes;
  String? cardId;
  String? function;

  TransactionReq({
    this.amount,
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
  });

  Map<String, dynamic> toJson({Map<String, String>? filter}) {
    final temp = <String, dynamic>{};

    if (amount != null) {
      temp['amount'] = amount;
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

    if (saveCard != null) {
      temp['saveCard'] = saveCard;
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
