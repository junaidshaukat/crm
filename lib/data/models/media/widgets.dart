import '/core/app_export.dart';

class WidgetRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  List<WidgetData>? data;

  WidgetRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory WidgetRes.fromJson(Map<String, dynamic> json) {
    return WidgetRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null
          ? List<WidgetData>.from(
              json['data'].map((x) => WidgetData.fromJson(x)))
          : null,
    );
  }
}

class WidgetData {
  num? tagNumber;
  num? organizationTag;
  String? name;
  String? icon;
  bool? valueRequired;
  num? widgetTag;
  String? widgetValue;
  num? location;
  bool? status;
  String? createDateTime;
  String? updateDateTime;

  WidgetData({
    this.tagNumber,
    this.organizationTag,
    this.name,
    this.icon,
    this.valueRequired,
    this.widgetTag,
    this.widgetValue,
    this.location,
    this.status,
    this.createDateTime,
    this.updateDateTime,
  });

  factory WidgetData.fromJson(Map<String, dynamic> json) {
    return WidgetData(
      tagNumber: json['tagNumber'],
      organizationTag: json['organizationTag'],
      name: json['name'],
      icon: json['icon'],
      valueRequired: json['valueRequired'],
      widgetTag: json['widgetTag'],
      widgetValue: json['widgetValue'],
      location: json['location'],
      status: json['status'],
      createDateTime: json['createDateTime'],
      updateDateTime: json['updateDateTime'],
    );
  }
}
