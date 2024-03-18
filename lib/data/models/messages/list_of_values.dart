import '../common/message.dart';

class ListOfValuesReq {
  String? listName;

  ListOfValuesReq({
    this.listName,
  });

  factory ListOfValuesReq.fromJson(Map<String, dynamic> json) {
    return ListOfValuesReq(
      listName: json['listName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'listName': listName,
    };
  }
}

class ListOfValuesRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  List<ListOfValues>? data;

  ListOfValuesRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory ListOfValuesRes.fromJson(Map<String, dynamic> json) {
    return ListOfValuesRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: (json['data'] as List<dynamic>?)?.map((item) => ListOfValues.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'messageDetails': messageDetails,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class ListOfValues {
  String? value;
  String? label;
  String? control;

  ListOfValues({
    this.value,
    this.label,
    this.control,
  });

  factory ListOfValues.fromJson(Map<String, dynamic> json) {
    return ListOfValues(
      value: json['value'],
      label: json['label'],
      control: json['control'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'label': label,
      'control': control,
    };
  }
}
