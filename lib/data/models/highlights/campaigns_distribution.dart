import '/core/app_export.dart';

class CampaignsDistributionReq {
  String? email;
  String? year;

  CampaignsDistributionReq({
    this.email,
    this.year,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'year': year,
    };
  }

  String toQueryString() {
    return toJson()
        .entries
        .where((e) => e.value != null)
        .map((e) => '${e.key}=${e.value}')
        .join('&');
  }
}

class CampaignsDistributionRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  CampaignsDistribution? data;

  CampaignsDistributionRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory CampaignsDistributionRes.fromJson(Map<String, dynamic> json) {
    return CampaignsDistributionRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null
          ? CampaignsDistribution.fromJson(json['data'])
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

class CampaignsDistribution {
  num? total;
  String? currencySymbol;
  List<CampaignValue>? values;

  CampaignsDistribution({
    this.total = 0,
    this.currencySymbol,
    this.values = const [],
  });

  factory CampaignsDistribution.fromJson(Map<String, dynamic> json) {
    List<CampaignValue>? values = (json['values'] as List<dynamic>?)
        ?.map((item) => CampaignValue.fromJson(item, 0))
        .toList();

    num total = values?.fold(0, (sum, value) {
          return sum! + (num.tryParse(value.amount ?? '0') ?? 0);
        }) ??
        0;

    return CampaignsDistribution(
      total: num.parse(total.toStringAsFixed(2)),
      currencySymbol: json['currencySymbol'],
      values: json['values'] != null
          ? (json['values'] as List<dynamic>?)
              ?.map((item) => CampaignValue.fromJson(item, total))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'currencySymbol': currencySymbol,
      'values': values?.map((item) => item.toJson()).toList(),
    };
  }
}

class CampaignValue {
  String? campaign;
  String? icon;
  String? amount;
  int? numberOfTransaction;
  num? percentage;

  CampaignValue({
    this.campaign,
    this.icon,
    this.amount,
    this.numberOfTransaction,
    this.percentage = 0,
  });

  factory CampaignValue.fromJson(Map<String, dynamic> json, num total) {
    num amount = json['amount'].toString().toNum;
    double percentage = total != 0 ? (amount / total) * 100 : 0;

    return CampaignValue(
      icon: json['icon'],
      percentage: percentage,
      campaign: json['campaign'],
      numberOfTransaction: json['numberOfTransaction'],
      amount: json['amount'].toString().toNum.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'campaign': campaign,
      'icon': icon,
      'amount': amount,
      'percentage': percentage,
      'numberOfTransaction': numberOfTransaction,
    };
  }
}
