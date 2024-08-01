import '/core/app_export.dart';

class YearlyReq {
  String? email;
  String? year;

  YearlyReq({
    this.email,
    this.year,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'year': year};
  }

  String toQueryString() {
    return toJson()
        .entries
        .where((e) => e.value != null)
        .map((e) => '${e.key}=${e.value}')
        .join('&');
  }
}

class YearlyRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  YearlyData? data;

  YearlyRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory YearlyRes.fromJson(Map<String, dynamic> json) {
    return YearlyRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null ? YearlyData.fromJson(json['data']) : null,
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

class YearlyData {
  String? currencySymbol;
  num? totalContribution;
  num? maxContribution;
  num? minContribution;
  num? numberOfContribution;

  YearlyData({
    this.currencySymbol = '',
    this.maxContribution = 0,
    this.minContribution = 0,
    this.totalContribution = 0,
    this.numberOfContribution = 0,
  });

  factory YearlyData.fromJson(Map<String, dynamic> json) {
    return YearlyData(
      currencySymbol: json['currencySymbol'],
      totalContribution: json['totalContribution'] != null
          ? json['totalContribution'].toString().toNum
          : 0,
      maxContribution: json['maxContribution'] != null
          ? json['maxContribution'].toString().toNum
          : 0,
      minContribution: json['minContribution'] != null
          ? json['minContribution'].toString().toNum
          : 0,
      numberOfContribution: json['numberOfContribution'] != null
          ? json['numberOfContribution'].toString().toNum
          : 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currencySymbol': currencySymbol,
      'totalContribution': totalContribution,
      'maxContribution': maxContribution,
      'minContribution': minContribution,
      'numberOfContribution': numberOfContribution,
    };
  }
}
