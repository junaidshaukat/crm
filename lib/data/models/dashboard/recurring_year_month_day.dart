import '/core/app_export.dart';

class RecurringSummaryReq {
  String? year;
  String? month;
  String? day;

  RecurringSummaryReq({this.year, this.month, this.day});

  RecurringSummaryReq.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (year != null) {
      data['year'] = year;
    }
    if (month != null) {
      data['month'] = month;
    }
    if (day != null) {
      data['day'] = day;
    }
    return data;
  }
}

class RecurringSummaryRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  RecurringSummary? data;

  RecurringSummaryRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  RecurringSummaryRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data =
        json['data'] != null ? RecurringSummary.fromJson(json['data']) : null;
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

class RecurringSummary {
  String? currencySymbol;
  dynamic themeHome;
  List<RecurringValues>? values;
  num? total;

  RecurringSummary({
    this.currencySymbol,
    this.themeHome,
    this.values,
    this.total = 0,
  });

  RecurringSummary.fromJson(dynamic json) {
    currencySymbol = json['currencySymbol'];
    themeHome = json['themeHome'];
    total = RecurringValues().total(json['values']);
    values = json['values'] != null
        ? RecurringValues().fromList(json['values'], total: total)
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

class RecurringValues {
  dynamic campaign;
  dynamic icon;
  num? amount;
  num? numberOfTransaction;
  num? percentage;

  RecurringValues({
    this.campaign,
    this.icon,
    this.amount,
    this.numberOfTransaction,
    this.percentage,
  });

  num percent(num total, num amount) {
    return num.parse(((amount / total) * 100).toStringAsFixed(2));
  }

  num total(json) {
    num totalAmount = 0;
    if (json != null) {
      totalAmount = (json as List<dynamic>)
          .map((value) => RecurringValues.fromJson(value).amount ?? 0)
          .fold(0, (prev, amount) => prev + amount);
    }
    return totalAmount;
  }

  List<RecurringValues> fromList(List json, {num? total}) {
    return json
        .map(
          (e) => RecurringValues(
            campaign: e['campaign'],
            icon: e['icon'],
            amount: e['amount'],
            numberOfTransaction: e['numberOfTransaction'],
            percentage: percent(total!, e['amount']),
          ),
        )
        .toList();
  }

  RecurringValues.fromJson(dynamic json) {
    campaign = json['campaign'];
    icon = json['icon'];
    amount = json['amount'];
    percentage = json['percentage'];
    numberOfTransaction = json['numberOfTransaction'];
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
