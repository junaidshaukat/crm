import '/core/app_export.dart';

class DonationYearReq {
  String? year;
  DonationYearReq({this.year});

  DonationYearReq.fromJson(Map<String, dynamic> json) {
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (year != null) {
      data['year'] = year;
    }
    return data;
  }
}

class DonationYearRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  DonationYear? data;

  DonationYearRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  DonationYearRes.fromJson(Map<String, dynamic> json, requestData) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? DonationYear.fromJson(json['data'], requestData) : null;
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

class DonationYear {
  String? donation;
  String? currencySymbol;
  String? year;

  DonationYear({this.donation, this.currencySymbol, this.year});

  DonationYear.fromJson(
    Map<String, dynamic> json,
    dynamic requestData,
  ) {
    donation = json['donation'];
    currencySymbol = json['currencySymbol'];
    year = requestData['year'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (donation != null) {
      data['donation'] = donation;
    }
    if (currencySymbol != null) {
      data['currencySymbol'] = currencySymbol;
    }
    if (year != null) {
      data['year'] = year;
    }

    return data;
  }
}
