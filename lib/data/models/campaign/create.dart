import '/core/app_export.dart';

class CampaignCreateReq {
  String? name;
  String? description;
  String? startDate;
  String? endDate;
  String? targetAmount;
  String? minimumAmount;
  String? sortOrder;
  String? fees;
  String? taxReceiptRatio;
  bool? issueTaxReceipt;
  bool? status;
  bool? donationCampaign;
  bool? hidden;
  bool? allowRecurringModification;
  bool? enableQuantity;
  String? iconTag;
  List<NodeData>? nodes;

  CampaignCreateReq({
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
    this.enableQuantity = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'targetAmount': targetAmount ?? 0,
      'minimumAmount': minimumAmount ?? 0,
      'taxReceiptRatio': taxReceiptRatio ?? 0,
      'sortOrder': sortOrder ?? 1,
      'donationCampaign': donationCampaign == true ? 1 : 0,
      'fees': fees ?? 0,
      'issueTaxReceipt': issueTaxReceipt == true ? 1 : 0,
      'status': status == true ? 1 : 0,
      'hidden': hidden == true ? 1 : 0,
      'enableQuantity': enableQuantity == true ? 1 : 0,
      'allowRecurringModification': allowRecurringModification == true ? 1 : 0,
      'iconTag': iconTag,
      'nodes': nodes?.map((node) {
        return {
          "tagNumber": node.tagNumber,
          "nodeTag": node.tagNumber,
          "status": node.status,
          "active": node.active,
        };
      }).toList(),
    };
  }
}

class CampaignCreateRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  dynamic data;

  CampaignCreateRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory CampaignCreateRes.fromJson(Map<String, dynamic> json) {
    return CampaignCreateRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'],
    );
  }
}
