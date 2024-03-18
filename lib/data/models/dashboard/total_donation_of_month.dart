import '/core/app_export.dart';

class DonationMonthReq {
  String? year;
  String? month;
  String? channel;

  DonationMonthReq({this.year, this.month, this.channel});

  DonationMonthReq.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    channel = json['channel'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (year != null) {
      data['year'] = year;
    }
    if (month != null) {
      data['month'] = month;
    }
    if (channel != null) {
      data['channel'] = channel;
    }
    return data;
  }
}

class DonationMonthRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  DonationMonth? data;

  DonationMonthRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  DonationMonthRes.fromJson(Map<String, dynamic> json, Map<String, dynamic> requestData) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? DonationMonth.fromJson(json['data'], requestData) : null;
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

class DonationMonth {
  dynamic currencySymbol;
  List<DonationOfDayValues>? values;
  double? total;
  String? year;
  String? month;

  DonationMonth({
    this.currencySymbol,
    this.values,
    this.total,
    this.month,
    this.year,
  });

  DonationMonth.fromJson(Map<String, dynamic> json, Map<String, dynamic> requestData) {
    currencySymbol = json['currencySymbol'];
    values = json['values'] != null ? DonationOfDayValues().fromList(json['values']) : null;
    total = json['values'] != null ? DonationOfDayValues().total(json['values']) : null;
    month = requestData['month'];
    year = requestData['year'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (currencySymbol != null) {
      data['currencySymbol'] = currencySymbol;
    }
    if (values != null) {
      data['values'] = values;
    }
    if (total != null) {
      data['total'] = total;
    }
    if (month != null) {
      data['month'] = month;
    }
    if (year != null) {
      data['year'] = year;
    }

    return data;
  }
}

class DonationOfDayValues {
  dynamic day;
  dynamic amount;

  DonationOfDayValues({
    this.day,
    this.amount,
  });

  List<DonationOfDayValues> fromList(List json) {
    return json
        .map(
          (e) => DonationOfDayValues(
            day: e['day'],
            amount: e['amount'],
          ),
        )
        .toList();
  }

  double total(List collection) {
    double sum = 0;
    for (var e in collection) {
      sum = sum + double.parse(e['amount'].toString().number);
    }
    return sum;
  }

  DonationOfDayValues.fromJson(dynamic json) {
    day = json['day'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (day != null) {
      data['day'] = day;
    }
    if (amount != null) {
      data['amount'] = amount;
    }

    return data;
  }
}
