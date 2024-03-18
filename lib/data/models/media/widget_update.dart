
class WidgetUpdateReq {
  String? widgetValue;
  bool? status;

  WidgetUpdateReq({
    this.widgetValue,
    this.status,
  });

  Map<String, dynamic> toJson({Map<String, String>? filter}) {
    final temp = <String, dynamic>{};

    if (widgetValue != null) {
      temp['widgetValue'] = widgetValue;
    }

    if (status != null) {
      temp['status'] = status;
    }

    return temp;
  }
}

class WidgetUpdateRes {
  String? instanceId;
  bool? result;
  String? message;
  String? messageDetails;
  Widgets? data;

  WidgetUpdateRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory WidgetUpdateRes.fromJson(Map<String, dynamic> json) {
    return WidgetUpdateRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: json['messageDetails'],
      data: json['data'] != null ? Widgets.fromJson(json['data']) : null,
    );
  }
}

class Widgets {
  int? tagNumber;
  int? organizationTag;
  String? name;
  String? icon;
  bool? valueRequired;
  int? widgetTag;
  String? widgetValue;
  int? location;
  bool? status;
  String? createDateTime;
  String? updateDateTime;

  Widgets({
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

  factory Widgets.fromJson(Map<String, dynamic> json) {
    return Widgets(
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
