class TransactionRouteName {
  List<NodeType>? nodeTypes;
  List<CampaignTag>? campaignTags;
  List<PaymentProcessor>? paymentProcessors;
  List<NodeName>? nodeNames;
  List<CardType>? cardTypes;
  List<ActiveCampaign>? activeCampaigns;

  TransactionRouteName({
    this.nodeTypes,
    this.campaignTags,
    this.paymentProcessors,
    this.nodeNames,
    this.cardTypes,
    this.activeCampaigns,
  });

  TransactionRouteName.fromJson(Map<String, dynamic> data) {
    nodeTypes =
        (data['node_type'] as List).map((e) => NodeType.fromJson(e)).toList();
    campaignTags = (data['campaign_tag'] as List)
        .map((e) => CampaignTag.fromJson(e))
        .toList();
    paymentProcessors = (data['payment_processor'] as List)
        .map((e) => PaymentProcessor.fromJson(e))
        .toList();
    nodeNames =
        (data['node_name'] as List).map((e) => NodeName.fromJson(e)).toList();
    cardTypes =
        (data['card_type'] as List).map((e) => CardType.fromJson(e)).toList();
    activeCampaigns = (data['active_campaign'] as List)
        .map((e) => ActiveCampaign.fromJson(e))
        .toList();
  }
}

class NodeType {
  String? value;
  String? label;

  NodeType({this.value, this.label});

  NodeType.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }
}

class CampaignTag {
  num? value;
  String? label;

  CampaignTag({this.value, this.label});

  CampaignTag.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }
}

class PaymentProcessor {
  String? value;
  String? label;

  PaymentProcessor({this.value, this.label});

  PaymentProcessor.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }
}

class NodeName {
  String? value;
  String? label;

  NodeName({this.value, this.label});

  NodeName.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }
}

class CardType {
  String? value;
  String? label;

  CardType({this.value, this.label});

  CardType.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }
}

class ActiveCampaign {
  num? value;
  String? label;
  num? minimumAmount;
  num? fees;

  ActiveCampaign({this.value, this.label, this.minimumAmount, this.fees});

  ActiveCampaign.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
    minimumAmount = json['minimumAmount'];
    fees = json['fees'];
  }
}
