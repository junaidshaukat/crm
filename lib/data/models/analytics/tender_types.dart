import '/core/app_export.dart';

class TenderTypesReq {
  String? year;

  TenderTypesReq({
    this.year,
  });

  Map<String, dynamic> toJson() {
    return {
      'year': year,
    };
  }
}

class TenderTypesRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  TenderTypes? data;

  TenderTypesRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory TenderTypesRes.fromJson(
    Map<String, dynamic> json,
    Map<String, dynamic> requestData,
  ) {
    return TenderTypesRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null
          ? TenderTypes.fromJson(
              json['data'],
              requestData: requestData,
            )
          : null,
    );
  }
}

class TenderTypes {
  String? currencySymbol;
  List<TenderTypesValue>? values;
  String? year;
  num? total;

  TenderTypes({
    this.currencySymbol,
    this.values,
    this.year,
    this.total = 0,
  });

  factory TenderTypes.fromJson(Map<String, dynamic> json, {Map<String, dynamic>? requestData}) {
    num totalAmount = 0;
    // Calculate the total amount by summing up the 'amount' values in 'values'
    if (json['values'] != null) {
      totalAmount = (json['values'] as List<dynamic>).map((value) => TenderTypesValue.fromJson(value).amount ?? 0).fold(0, (prev, amount) => prev + amount);
    }

    return TenderTypes(
      year: requestData?['year'],
      currencySymbol: json['currencySymbol'],
      values: json['values'] != null ? (json['values'] as List<dynamic>).map((value) => TenderTypesValue.fromJson(value)).toList() : null,
      total: totalAmount,
    );
  }
}

class TenderTypesValue {
  String? tenderType;
  num? amount;
  num? numberOfTransaction;
  String? text;

  TenderTypesValue({
    this.tenderType,
    this.amount,
    this.numberOfTransaction,
    this.text,
  });

  factory TenderTypesValue.fromJson(Map<String, dynamic> json) {
    return TenderTypesValue(
      tenderType: json['tenderType'],
      amount: json['amount'],
      numberOfTransaction: json['numberOfTransaction'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tenderType': tenderType,
      'amount': amount,
      'numberOfTransaction': numberOfTransaction,
      'text': text,
    };
  }
}
