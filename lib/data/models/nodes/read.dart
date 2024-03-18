import '/core/app_export.dart';

class NodeReadRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  List<NodeData>? data;

  NodeReadRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory NodeReadRes.fromJson(Map<String, dynamic> json) {
    var dataJson = json['data'] as List<dynamic>?;

    List<NodeData>? iconDataList;
    if (dataJson != null) {
      iconDataList = dataJson.map((e) => NodeData.fromJson(e)).toList();
    }

    return NodeReadRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: iconDataList,
    );
  }
}

class NodeData {
  num? tagNumber;
  num? nodeTag;
  String? organizationDefinedName;
  String? type;
  bool? includeInBatchReport;
  bool? active;
  bool? status;

  NodeData({
    this.tagNumber,
    this.organizationDefinedName,
    this.type,
    this.includeInBatchReport,
    this.active,
    this.status,
    this.nodeTag,
  });

  factory NodeData.fromJson(Map<String, dynamic> json) {
    return NodeData(
      tagNumber: json['tagNumber'],
      organizationDefinedName: json['organizationDefinedName'],
      type: json['type'],
      includeInBatchReport: json['includeInBatchReport'],
      active: json['active'],
      status: json['status'],
      nodeTag: json['nodeTag'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tagNumber': tagNumber,
      'organizationDefinedName': organizationDefinedName,
      'type': type,
      'includeInBatchReport': includeInBatchReport,
      'active': active,
      'status': status,
      'nodeTag': nodeTag,
    };
  }
}
