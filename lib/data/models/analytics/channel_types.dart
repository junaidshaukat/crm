import '/core/app_export.dart';

class ChannelTypesReq {
  String? year;
  String? month;

  ChannelTypesReq({this.year, this.month});

  Map<String, dynamic> toJson() {
    return {'year': year, 'month': month};
  }
}

class ChannelTypesRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  ChannelTypes? data;

  ChannelTypesRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory ChannelTypesRes.fromJson(
    Map<String, dynamic> json,
    Map<String, dynamic> requestData,
  ) {
    return ChannelTypesRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null
          ? ChannelTypes.fromJson(
              json['data'],
              requestData: requestData,
            )
          : null,
    );
  }
}

class ChannelTypes {
  String? currencySymbol;
  List<ChannelTypesValue>? values;
  num? total;
  String? year;
  String? month;

  ChannelTypes({
    this.currencySymbol,
    this.values,
    this.total,
    this.year,
    this.month,
  });

  factory ChannelTypes.fromJson(Map<String, dynamic> json,
      {Map<String, dynamic>? requestData}) {
    num totalAmount = 0;
    // Calculate the total amount by summing up the 'amount' values in 'values'
    if (json['values'] != null) {
      totalAmount = (json['values'] as List<dynamic>)
          .map((value) => ChannelTypesValue.fromJson(value).amount ?? 0)
          .fold(0, (prev, amount) => prev + amount);
    }

    return ChannelTypes(
      currencySymbol: json['currencySymbol'],
      values: json['values'] != null
          ? (json['values'] as List<dynamic>)
              .map((value) => ChannelTypesValue.fromJson(value))
              .toList()
          : null,
      total: totalAmount,
      year: requestData?['year'],
      month: requestData?['month'],
    );
  }
}

class ChannelTypesValue {
  String? channelType;
  num? amount;
  num? numberOfTransaction;
  String? text;

  ChannelTypesValue({
    this.channelType,
    this.amount,
    this.numberOfTransaction,
    this.text,
  });

  factory ChannelTypesValue.fromJson(Map<String, dynamic> json) {
    return ChannelTypesValue(
      channelType: json['channelType'],
      amount: json['amount'],
      numberOfTransaction: json['numberOfTransaction'],
      text: json['text'],
    );
  }

  toJson() {
    return {
      'channelType': channelType,
      'amount': amount,
      'numberOfTransaction': numberOfTransaction,
      'text': text,
    };
  }
}
