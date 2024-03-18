import '/core/app_export.dart';

/// 12 -Campaign Summary - P10
class CampaignSummaryReq {
  List<String>? channelType;
  int? year;
  int? month;
  int? day;

  CampaignSummaryReq({this.channelType, this.year, this.month, this.day});

  CampaignSummaryReq.fromJson(Map<String, dynamic> json) {
    channelType = json['channelType'];
    year = json['year'];
    month = json['month'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (channelType != null) {
      data['channelType'] = channelType;
    }
    if (year != null) {
      data['year'] = year;
    }
    if (month != null) {
      data['month'] = month.toString().padLeft(2, '0');
    }
    if (day != null) {
      data['day'] = day.toString().padLeft(2, '0');
    }
    return data;
  }
}

class CampaignSummaryRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  CampaignSummary? data;

  CampaignSummaryRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  CampaignSummaryRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? CampaignSummary.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (instanceId != null) {
      data['instanceId'] = instanceId;
    }
    if (result != null) {
      data['result'] = result;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (messageDetails != null) {
      data['messageDetails'] = messageDetails;
    }
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class CampaignSummary {
  String? currencySymbol;
  String? themeHome;
  List<CampaignValues>? values;
  num? total;

  CampaignSummary({
    this.currencySymbol,
    this.themeHome,
    this.values,
    this.total = 0,
  });

  CampaignSummary.fromJson(dynamic json) {
    currencySymbol = json['currencySymbol'];
    themeHome = json['themeHome'];
    total = CampaignValues().total(json['values']);
    values = json['values'] != null
        ? CampaignValues().fromList(json['values'], total: total)
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (currencySymbol != null) {
      data['currencySymbol'] = currencySymbol;
    }
    if (themeHome != null) {
      data['themeHome'] = themeHome;
    }
    if (total != null) {
      data['total'] = total;
    }
    if (values != null) {
      data['values'] = values;
    }

    return data;
  }
}

class CampaignValues {
  String? campaign;
  String? icon;
  num? amount;
  num? numberOfTransaction;
  num? percentage;

  CampaignValues({
    this.campaign,
    this.icon,
    this.amount,
    this.numberOfTransaction,
    this.percentage = 0,
  });

  List<CampaignValues> fromList(List json, {num? total}) {
    return json
        .map(
          (e) => CampaignValues(
            campaign: e['campaign'],
            icon: e['icon'],
            amount: e['amount'].toString().toNum,
            numberOfTransaction: e['numberOfTransaction'].toString().toNum,
            percentage: percent(total, e['amount']),
          ),
        )
        .toList();
  }

  num percent(total, amount) {
    num part = amount.toString().toNum;
    num whole = total.toString().toNum;

    return ((part / whole) * 100).toStringAsFixed(2).toNum;
  }

  num total(json) {
    num totalAmount = 0;
    if (json != null) {
      totalAmount = (json as List<dynamic>)
          .map((value) => CampaignValues.fromJson(value).amount ?? 0)
          .fold(0, (prev, amount) => prev + amount);
    }
    return totalAmount;
  }

  CampaignValues.fromJson(dynamic json) {
    campaign = json['campaign'];
    icon = json['icon'];
    amount = json['amount'].toString().toNum;
    percentage = json['percentage'] ?? 0;
    numberOfTransaction = json['numberOfTransaction'].toString().toNum;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (campaign != null) {
      data['campaign'] = campaign;
    }
    if (icon != null) {
      data['icon'] = icon;
    }
    if (amount != null) {
      data['amount'] = amount;
    }
    if (numberOfTransaction != null) {
      data['numberOfTransaction'] = numberOfTransaction;
    }
    if (percentage != null) {
      data['percentage'] = percentage;
    }
    return data;
  }
}
