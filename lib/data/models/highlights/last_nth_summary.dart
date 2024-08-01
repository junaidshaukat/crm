import '/core/app_export.dart';

class LastNthSummaryReq {
  String? email;
  String? n;

  LastNthSummaryReq({
    this.email,
    this.n,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'n': n};
  }

  String toQueryString() {
    return toJson()
        .entries
        .where((e) => e.value != null)
        .map((e) => '${e.key}=${e.value}')
        .join('&');
  }
}

class LastNthSummaryRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  LastNthSummaryData? data;

  LastNthSummaryRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory LastNthSummaryRes.fromJson(Map<String, dynamic> json) {
    return LastNthSummaryRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null
          ? LastNthSummaryData.fromJson(json['data'])
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

class LastNthSummaryData {
  String? currencySymbol;
  num? totalContribution;
  num? numberOfContribution;
  String? since;

  LastNthSummaryData({
    this.since = '',
    this.currencySymbol = '',
    this.totalContribution = 0,
    this.numberOfContribution = 0,
  });

  factory LastNthSummaryData.fromJson(Map<String, dynamic> json) {
    return LastNthSummaryData(
      currencySymbol: json['currencySymbol'],
      totalContribution: json['totalContribution'] != null
          ? json['totalContribution'].toString().toNum
          : 0,
      numberOfContribution: json['numberOfContribution'] != null
          ? json['numberOfContribution'].toString().toNum
          : 0,
      since: json['since'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currencySymbol': currencySymbol,
      'totalContribution': totalContribution,
      'numberOfContribution': numberOfContribution,
      'since': since,
    };
  }
}
