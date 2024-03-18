import '/core/app_export.dart';

class WalletReq {
  String? email;

  WalletReq({this.email});

  Map<String, dynamic> toJson({Map<String, String>? filter}) {
    final temp = <String, dynamic>{};

    if (email != null) {
      temp['email'] = email;
    }

    return temp;
  }
}

class WalletRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  List<WalletData> data;

  WalletRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data = const [],
  });

  factory WalletRes.fromJson(Map<String, dynamic> json) {
    return WalletRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null
          ? List<WalletData>.from(
              json['data'].map((x) => WalletData.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'messageDetails': messageDetails,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class WalletData {
  String? source;
  String? cardId;
  String? function;
  String? name;
  String? number;
  String? expiryMonth;
  String? expiryYear;
  String? expiryDate;
  String? cardType;
  String? cardImage;
  bool? isExpired;
  String? ccv;
  bool? saveCard;

  WalletData({
    this.source = 'WALLET',
    this.cardId,
    this.function,
    this.name,
    this.number,
    this.expiryMonth,
    this.expiryYear,
    this.expiryDate,
    this.cardType,
    this.cardImage,
    this.isExpired,
    this.ccv,
    this.saveCard = false,
  });

  factory WalletData.fromJson(Map<String, dynamic> json) {
    return WalletData(
      source: json['source'],
      cardId: json['cardId'],
      function: json['function'],
      name: json['name'],
      number: json['number'],
      expiryMonth: json['expiryMonth'],
      expiryYear: json['expiryYear'],
      expiryDate: json['expiryDate'],
      cardType: json['cardType'],
      cardImage: json['cardImage'],
      isExpired: json['isExpired'],
      ccv: json['ccv'],
      saveCard: json['saveCard'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (source != null) data['source'] = source;
    if (cardId != null) data['cardId'] = cardId;
    if (function != null) data['function'] = function;
    if (name != null) data['name'] = name;
    if (number != null) data['number'] = number;
    if (expiryMonth != null) data['expiryMonth'] = expiryMonth;
    if (expiryYear != null) data['expiryYear'] = expiryYear;
    if (expiryDate != null) data['expiryDate'] = expiryDate;
    if (cardType != null) data['cardType'] = cardType;
    if (cardImage != null) data['cardImage'] = cardImage;
    if (isExpired != null) data['isExpired'] = isExpired;
    if (ccv != null) data['ccv'] = ccv;
    if (saveCard != null) data['saveCard'] = saveCard;
    return data;
  }
}
