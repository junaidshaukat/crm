import '/core/app_export.dart';

class ChannelDetailsReq {
  String? year;
  String? month;
  String? day;

  ChannelDetailsReq({
    this.year,
    this.month,
    this.day,
  });

  factory ChannelDetailsReq.fromJson(Map<String, dynamic> json) {
    return ChannelDetailsReq(
      year: json['year'],
      month: json['month'],
      day: json['day'],
    );
  }

  Map<String, dynamic> toJson({
    Map<String, String>? filter,
    Map<String, List>? query,
  }) {
    final temp = <String, dynamic>{};

    if (year != null) {
      temp['year'] = year;
    }

    if (month != null) {
      temp['month'] = month;
    }

    if (day != null) {
      temp['day'] = day;
    }

    return temp;
  }
}

class ChannelDetailsRes {
  String instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  List<ChannelDetails>? data;

  ChannelDetailsRes({
    this.instanceId = '',
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory ChannelDetailsRes.fromJson(Map<String, dynamic> json) {
    return ChannelDetailsRes(
      instanceId: json['instanceId'] ?? '',
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null
          ? List<ChannelDetails>.from(
              json['data'].map((x) => ChannelDetails.fromJson(x)),
            )
          : null,
    );
  }
}

class ChannelDetails {
  String amount;
  String campaign;
  String currencySymbol;
  num numberOfTransaction;

  ChannelDetails({
    required this.amount,
    required this.campaign,
    required this.currencySymbol,
    required this.numberOfTransaction,
  });

  factory ChannelDetails.fromJson(Map<String, dynamic> json) {
    EnvConfig env = EnvConfig();

    return ChannelDetails(
      amount: json['amount'],
      campaign: json['campaign'],
      currencySymbol: env.currencySymbol,
      numberOfTransaction: json['numberOfTransaction'],
    );
  }

  num totalAmount(List<ChannelDetails> items) {
    final total = items.fold(0.0, (sum, item) => sum + (item.amount.toNum));
    if (total == 0) return 0;
    return total;
  }

  num totalTransaction(List<ChannelDetails> items) {
    final total =
        items.fold(0.0, (sum, item) => sum + (item.numberOfTransaction));
    if (total == 0) return 0;
    return total;
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'campaign': campaign,
      'currencySymbol': currencySymbol,
      'numberOfTransaction': numberOfTransaction,
    };
  }
}
