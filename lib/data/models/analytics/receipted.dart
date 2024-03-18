import '/core/app_export.dart';

class ReceiptedReq {
  String? year;

  ReceiptedReq({this.year});

  Map<String, dynamic> toJson() {
    return {
      'year': year
    };
  }
}

class ReceiptedRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  Receipted? data;

  ReceiptedRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory ReceiptedRes.fromJson(Map<String, dynamic> json, Map<String, dynamic> requestData) {
    return ReceiptedRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null ? Receipted.fromJson(json['data'], requestData: requestData) : null,
    );
  }
}

class Receipted {
  String? currencySymbol;
  List<ReceiptedValue>? values;
  String? year;
  num? total;

  Receipted({
    this.currencySymbol,
    this.values,
    this.year,
    this.total = 0,
  });

  factory Receipted.fromJson(Map<String, dynamic> json, {Map<String, dynamic>? requestData}) {
    num totalAmount = 0;
    // Calculate the total amount by summing up the 'amount' values in 'values'
    if (json['values'] != null) {
      totalAmount = (json['values'] as List<dynamic>).map((value) => ReceiptedValue.fromJson(value).amount ?? 0).fold(0, (prev, amount) => prev + amount);
    }

    return Receipted(
      total: totalAmount,
      year: requestData?['year'],
      currencySymbol: json['currencySymbol'],
      values: json['values'] != null ? (json['values'] as List<dynamic>).map((value) => ReceiptedValue.fromJson(value)).toList() : null,
    );
  }
}

class ReceiptedValue {
  String? receiptedType;
  num? amount;
  num? numberOfTransaction;
  num? percentage;

  ReceiptedValue({
    this.receiptedType,
    this.amount,
    this.numberOfTransaction,
    this.percentage,
  });

  factory ReceiptedValue.fromJson(Map<String, dynamic> json) {
    return ReceiptedValue(
      receiptedType: json['receiptedType'],
      amount: json['amount'],
      numberOfTransaction: json['numberOfTransaction'],
      percentage: json['percentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'receiptedType': receiptedType,
      'amount': amount,
      'numberOfTransaction': numberOfTransaction,
      'percentage': percentage,
    };
  }
}
