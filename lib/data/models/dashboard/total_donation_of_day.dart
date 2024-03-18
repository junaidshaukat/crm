import '/core/app_export.dart';

class DonationDayReq {
  String? date;
  String? channel;

  DonationDayReq({this.date, this.channel = ""});

  DonationDayReq.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    channel = json['channel'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (date != null) {
      data['date'] = date;
    }
    if (channel != null) {
      data['channel'] = channel;
    }
    return data;
  }
}

class DonationDayRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  DonationDay? data;

  DonationDayRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  DonationDayRes.fromJson(Map<String, dynamic> json, Map<String, dynamic> requestData) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? DonationDay.fromJson(json['data'], requestData) : null;
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

class DonationDay {
  dynamic currencySymbol;
  List<DonationValues>? values;
  double? total;
  String? date;

  DonationDay({this.currencySymbol, this.values, this.total, this.date});

  DonationDay.fromJson(Map<String, dynamic> json, Map<String, dynamic> requestData) {
    currencySymbol = json['currencySymbol'];
    values = json['values'] != null ? DonationValues().fromList(json['values']) : null;
    total = json['values'] != null ? DonationValues().total(json['values']) : null;
    date = requestData['date'];
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
    if (date != null) {
      data['date'] = date;
    }

    return data;
  }
}

class DonationValues {
  dynamic campaign;
  dynamic amount;
  dynamic numberOfTransaction;

  DonationValues({
    this.campaign,
    this.amount,
    this.numberOfTransaction,
  });

  List<DonationValues> fromList(List json) {
    return json
        .map(
          (e) => DonationValues(
            campaign: e['campaign'],
            amount: e['amount'],
            numberOfTransaction: e['numberOfTransaction'],
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

  DonationValues.fromJson(dynamic json) {
    campaign = json['campaign'];
    amount = json['amount'];
    numberOfTransaction = json['numberOfTransaction'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (campaign != null) {
      data['campaign'] = campaign;
    }
    if (amount != null) {
      data['amount'] = amount;
    }
    if (numberOfTransaction != null) {
      data['numberOfTransaction'] = numberOfTransaction;
    }

    return data;
  }
}
