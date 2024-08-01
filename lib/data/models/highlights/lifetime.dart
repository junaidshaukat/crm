import '/core/app_export.dart';

class LifetimeReq {
  String? email;

  LifetimeReq({
    this.email,
  });

  Map<String, dynamic> toJson() {
    return {'email': email};
  }

  String toQueryString() {
    return toJson()
        .entries
        .where((e) => e.value != null)
        .map((e) => '${e.key}=${e.value}')
        .join('&');
  }
}

class LifetimeRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  LifetimeData? data;

  LifetimeRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory LifetimeRes.fromJson(Map<String, dynamic> json) {
    return LifetimeRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null ? LifetimeData.fromJson(json['data']) : null,
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

class LifetimeData {
  String? currencySymbol;
  num? totalContribution;
  num? maxContribution;
  num? minContribution;
  num? numberOfContribution;

  LifetimeData({
    this.currencySymbol = '',
    this.maxContribution = 0,
    this.minContribution = 0,
    this.totalContribution = 0,
    this.numberOfContribution = 0,
  });

  factory LifetimeData.fromJson(Map<String, dynamic> json) {
    return LifetimeData(
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
      'maxContribution': maxContribution?.toString(),
      'minContribution': minContribution?.toString(),
      'totalContribution': totalContribution?.toString(),
      'numberOfContribution': numberOfContribution?.toString(),
    };
  }
}
