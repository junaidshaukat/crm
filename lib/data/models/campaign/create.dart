import '/core/app_export.dart';

class CampaignCreateReq {
  String? name;
  String? fees;
  bool? status;
  bool? hidden;
  String? endDate;
  String? iconTag;
  String? startDate;
  String? sortOrder;
  String? description;
  String? recurringDay;
  String? targetAmount;
  bool? enableQuantity;
  List<String>? amounts;
  String? minimumAmount;
  bool? issueTaxReceipt;
  List<NodeData>? nodes;
  bool? donationCampaign;
  String? taxReceiptRatio;
  List<String>? frequency;
  bool? allowRecurringModification;

  CampaignCreateReq({
    this.name,
    this.fees,
    this.nodes,
    this.status,
    this.hidden,
    this.endDate,
    this.iconTag,
    this.amounts,
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
      'fees': fees ?? 0,
      'endDate': endDate,
      'amounts': amounts,
      'iconTag': iconTag,
      'startDate': startDate,
      'frequency': frequency,
      'description': description,
      'sortOrder': sortOrder ?? 1,
      'recurringDay': recurringDay?.day,
      'status': status == true ? 1 : 0,
      'hidden': hidden == true ? 1 : 0,
      'enableQuantity': enableQuantity,
      'targetAmount': targetAmount ?? 0,
      'minimumAmount': minimumAmount ?? 0,
      'taxReceiptRatio': taxReceiptRatio ?? 0,
      'issueTaxReceipt': issueTaxReceipt == true ? 1 : 0,
      'donationCampaign': donationCampaign == true ? 1 : 0,
      'allowRecurringModification': allowRecurringModification == true ? 1 : 0,
      'nodes': nodes?.map((node) {
        return {
          "status": node.status,
          "active": node.active,
          "nodeTag": node.tagNumber,
          "tagNumber": node.tagNumber,
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
