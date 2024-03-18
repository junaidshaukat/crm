import '/core/app_export.dart';

class DonationSinceReq {
  DonationSinceReq();

  DonationSinceReq.fromJson(Map<String, dynamic> json) {
    DonationSinceReq();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}

class DonationSinceRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  DonationSince? data;

  DonationSinceRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  DonationSinceRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? DonationSince.fromJson(json['data']) : null;
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

class DonationSince {
  String? donation;
  String? currencySymbol;
  String? signupDate;

  DonationSince({this.donation, this.currencySymbol, this.signupDate});

  DonationSince.fromJson(Map<String, dynamic> json) {
    donation = json['donation'];
    currencySymbol = json['currencySymbol'];
    signupDate = json['signupDate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (donation != null) {
      data['donation'] = donation;
    }
    if (currencySymbol != null) {
      data['currencySymbol'] = currencySymbol;
    }
    if (signupDate != null) {
      data['signupDate'] = signupDate;
    }

    return data;
  }
}
