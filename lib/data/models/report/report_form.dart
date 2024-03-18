import '/core/app_export.dart';

class ReportFormReq {
  String? caller;

  ReportFormReq({
    this.caller = 'reports',
  });

  factory ReportFormReq.fromJson(Map<String, dynamic> json) {
    return ReportFormReq(
      caller: json['caller'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'caller': caller,
    };
  }
}

class ReportFormRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  List<ReportFormData>? data;

  ReportFormRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory ReportFormRes.fromJson(Map<String, dynamic> json) {
    return ReportFormRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: List<ReportFormData>.from(json['data'].map((x) => ReportFormData.fromJson(x))),
    );
  }
}

class ReportFormData {
  num? tagNumber;
  num? reportTag;
  String? name;
  String? control;
  List<ReportFormValue>? values;
  String? defaultValue;
  String? label;
  bool? required;
  num? sortOrder;

  ReportFormData({
    this.tagNumber,
    this.reportTag,
    this.name,
    this.control,
    this.values,
    this.label,
    this.required,
    this.sortOrder,
    this.defaultValue,
  });

  factory ReportFormData.fromJson(Map<String, dynamic> json) {
    return ReportFormData(
      tagNumber: json['tagNumber'],
      reportTag: json['reportTag'],
      name: json['name'],
      control: json['control'],
      values: List<ReportFormValue>.from(json['values'].map((x) => ReportFormValue.fromJson(x))),
      defaultValue: json['defaultValue'],
      label: json['label'],
      required: json['required'],
      sortOrder: json['sortOrder'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tagNumber': tagNumber,
      'reportTag': reportTag,
      'name': name,
      'control': control,
      'values': values,
      'defaultValue': defaultValue,
      'label': label,
      'required': required,
      'sortOrder': sortOrder,
    };
  }
}

class ReportFormValue {
  String? value;
  String? label;

  ReportFormValue({
    this.value,
    this.label,
  });

  factory ReportFormValue.fromJson(Map<String, dynamic> json) {
    return ReportFormValue(
      value: json['value'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'label': label,
    };
  }
}
