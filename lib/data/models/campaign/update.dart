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
  bool? hidden;
  bool? enableQuantity;
  String? iconTag;
  List<NodeData>? nodes;
  String? taxReceiptRatio;
  bool? allowRecurringModification;

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
    this.hidden,
    this.iconTag,
    this.nodes,
    this.taxReceiptRatio,
    this.allowRecurringModification,
    this.enableQuantity,
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
      'taxReceiptRatio': taxReceiptRatio,
      'allowRecurringModification': allowRecurringModification == true ? 1 : 0,
      'issueTaxReceipt': issueTaxReceipt == true ? 1 : 0,
      'donationCampaign': donationCampaign == true ? 1 : 0,
      'status': status == true ? 1 : 0,
      'hidden': hidden == true ? 1 : 0,
      'enableQuantity': enableQuantity,
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
