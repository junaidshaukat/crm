import '/core/app_export.dart';

class KeyDatesReq {
  String? email;

  KeyDatesReq({
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

class KeyDatesRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  KeyDatesData? data;

  KeyDatesRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory KeyDatesRes.fromJson(Map<String, dynamic> json) {
    return KeyDatesRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null ? KeyDatesData.fromJson(json['data']) : null,
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

class KeyDatesData {
  String? registrationDate;
  String? lastContribution;
  String? firstContribution;

  KeyDatesData({
    this.registrationDate = '',
    this.lastContribution = '',
    this.firstContribution = '',
  });

  factory KeyDatesData.fromJson(Map<String, dynamic> json) {
    return KeyDatesData(
      registrationDate: json['registrationDate'],
      lastContribution: json['lastContribution'],
      firstContribution: json['firstContribution'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'registrationDate': registrationDate,
      'lastContribution': lastContribution,
      'firstContribution': firstContribution,
    };
  }
}
