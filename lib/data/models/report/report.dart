import '/core/app_export.dart';

class ReportReq {
  String? caller;

  ReportReq({
    this.caller = 'reports',
  });

  factory ReportReq.fromJson(Map<String, dynamic> json) {
    return ReportReq(
      caller: json['caller'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'caller': caller,
    };
  }
}

class ReportRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  List<ReportData>? data;

  ReportRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory ReportRes.fromJson(Map<String, dynamic> json) {
    return ReportRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: List<ReportData>.from(
        json['data'].map(
          (x) => ReportData.fromJson(x),
        ),
      ),
    );
  }
}

class ReportData {
  num? tagNumber;
  String? name;
  String? description;

  ReportData({
    this.tagNumber,
    this.name,
    this.description,
  });

  factory ReportData.fromJson(Map<String, dynamic> json) {
    return ReportData(
      tagNumber: json['tagNumber'],
      name: json['name'],
      description: json['description'],
    );
  }
}
