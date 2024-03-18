import '/core/app_export.dart';

class CampaignUpdateReq {
  String? name;
  String? description;
  String? startDate;
  String? endDate;
  String? targetAmount;
  String? minimumAmount;
  String? sortOrder;
  String? fees;
  bool? issueTaxReceipt;
  bool? donationCampaign;
  bool? status;
  String? iconTag;
  List<NodeData>? nodes;

  CampaignUpdateReq({
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.targetAmount,
    this.minimumAmount,
    this.sortOrder,
    this.fees,
    this.issueTaxReceipt,
    this.donationCampaign,
    this.status,
    this.iconTag,
    this.nodes,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'targetAmount': targetAmount,
      'minimumAmount': minimumAmount,
      'sortOrder': sortOrder,
      'fees': fees,
      'issueTaxReceipt': issueTaxReceipt == true ? 1 : 0,
      'donationCampaign': donationCampaign == true ? 1 : 0,
      'status': status == true ? 1 : 0,
      'iconTag': iconTag,
      'nodes': nodes?.map((node) {
        return {
          "tagNumber": node.tagNumber,
          "nodeTag": node.nodeTag,
          "status": node.status,
          "active": node.active,
        };
      }).toList(),
    };
  }
}

class CampaignUpdateRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  dynamic data;

  CampaignUpdateRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory CampaignUpdateRes.fromJson(Map<String, dynamic> json) {
    return CampaignUpdateRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'],
    );
  }
}
