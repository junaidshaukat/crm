import '/core/app_export.dart';

class CampaignUpdateReq {
  String? name;
  String? fees;
  bool? status;
  bool? hidden;
  String? endDate;
  String? iconTag;
  String? startDate;
  String? sortOrder;
  String? description;
  String? targetAmount;
  bool? enableQuantity;
  String? recurringDay;
  List<String>? amounts;
  String? minimumAmount;
  bool? issueTaxReceipt;
  List<NodeData>? nodes;
  bool? donationCampaign;
  String? taxReceiptRatio;
  List<String>? frequency;
  bool? allowRecurringModification;

  CampaignUpdateReq({
    this.name,
    this.fees,
    this.nodes,
    this.status,
    this.hidden,
    this.amounts,
    this.endDate,
    this.iconTag,
    this.startDate,
    this.sortOrder,
    this.frequency,
    this.description,
    this.recurringDay,
    this.targetAmount,
    this.minimumAmount,
    this.enableQuantity,
    this.issueTaxReceipt,
    this.taxReceiptRatio,
    this.donationCampaign,
    this.allowRecurringModification,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'fees': fees,
      'amounts': amounts,
      'endDate': endDate,
      'iconTag': iconTag,
      'frequency': frequency,
      'startDate': startDate,
      'sortOrder': sortOrder,
      'description': description,
      'targetAmount': targetAmount,
      'minimumAmount': minimumAmount,
      'status': status == true ? 1 : 0,
      'hidden': hidden == true ? 1 : 0,
      'enableQuantity': enableQuantity,
      'recurringDay': recurringDay?.day,
      'taxReceiptRatio': taxReceiptRatio,
      'issueTaxReceipt': issueTaxReceipt == true ? 1 : 0,
      'donationCampaign': donationCampaign == true ? 1 : 0,
      'allowRecurringModification': allowRecurringModification == true ? 1 : 0,
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
