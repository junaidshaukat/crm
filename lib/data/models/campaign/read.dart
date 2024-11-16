import '/core/app_export.dart';

class CampaignsReq {
  int? page;
  int? pageSize;
  String? by;
  String? order;

  CampaignsReq({
    this.page = 1,
    this.pageSize = 10,
    this.by,
    this.order = 'asc',
  });

  Map<String, dynamic> toJson({Map<String, String>? filter}) {
    final temp = <String, dynamic>{};
    if (page != null) {
      temp['page'] = page;
    }
    if (pageSize != null) {
      temp['pageSize'] = pageSize;
    }
    if (by != null) {
      temp['by'] = by;
    }
    if (order != null) {
      temp['order'] = order;
    }

    if (filter != null) {
      temp.addAll(filter);
    }

    return temp;
  }

  String toQueryString() {
    return toJson()
        .entries
        .where((e) => e.value != null)
        .map((e) => '${e.key}=${e.value}')
        .join('&');
  }
}

class CampaignsRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  CampaignLink? links;
  List<CampaignData>? data;

  CampaignsRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.links,
    this.data,
  });

  factory CampaignsRes.fromJson(Map<String, dynamic> json) {
    return CampaignsRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      links: CampaignLink.fromJson(json['links'] ?? {}),
      data: List<CampaignData>.from(
        (json['data'] as List<dynamic>?)?.map(
              (campaign) => CampaignData.fromJson(campaign),
            ) ??
            [],
      ),
    );
  }
}

class CampaignLink {
  num? total;
  num? count;
  num? perPage;
  num? currentPage;
  num? lastPage;
  String? firstPageUrl;
  String? lastPageUrl;
  String? nextPageUrl;
  String? previousPageUrl;
  num? from;
  num? to;

  CampaignLink({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.previousPageUrl,
    this.from,
    this.to,
  });

  factory CampaignLink.fromJson(Map<String, dynamic> json) {
    return CampaignLink(
      total: json['total'],
      count: json['count'],
      perPage: json['perPage'],
      currentPage: json['currentPage'],
      lastPage: json['lastPage'],
      firstPageUrl: json['firstPageUrl'],
      lastPageUrl: json['lastPageUrl'],
      nextPageUrl: json['nextPageUrl'],
      previousPageUrl: json['previousPageUrl'],
      from: json['from'],
      to: json['to'],
    );
  }
}

class CampaignData {
  num? fees;
  String? name;
  bool? status;
  bool? hidden;
  num? tagNumber;
  num? sortOrder;
  String? qrCode;
  String? banner;
  String? endDate;
  String? startDate;
  num? targetAmount;
  num? raisedAmount;
  List<num> amounts;
  num? recurringDay;
  num? minimumAmount;
  CampaignIcon? icon;
  String? description;
  num? taxReceiptRatio;
  bool? enableQuantity;
  bool? issueTaxReceipt;
  bool? donationCampaign;
  String? currencySymbol;
  List<String> frequency;
  List<CampaignNode>? nodes;
  bool? allowRecurringModification;

  CampaignData({
    this.name,
    this.fees,
    this.icon,
    this.nodes,
    this.status,
    this.hidden,
    this.banner,
    this.qrCode,
    this.endDate,
    this.tagNumber,
    this.startDate,
    this.sortOrder,
    this.description,
    this.targetAmount,
    this.recurringDay,
    this.raisedAmount,
    this.minimumAmount,
    this.enableQuantity,
    this.currencySymbol,
    this.issueTaxReceipt,
    this.taxReceiptRatio,
    this.donationCampaign,
    this.amounts = const [],
    this.frequency = const [],
    this.allowRecurringModification,
  });

  factory CampaignData.fromJson(Map<String, dynamic> json) {
    return CampaignData(
      name: json['name'],
      fees: json['fees'],
      status: json['status'],
      hidden: json['hidden'],
      qrCode: json['qrCode'],
      banner: json['banner'],
      endDate: json['endDate'],
      tagNumber: json['tagNumber'],
      startDate: json['startDate'],
      sortOrder: json['sortOrder'],
      description: json['description'],
      targetAmount: json['targetAmount'],
      raisedAmount: json['raisedAmount'],
      recurringDay: json['recurringDay'],
      minimumAmount: json['minimumAmount'],
      enableQuantity: json['enableQuantity'],
      currencySymbol: json['currencySymbol'],
      taxReceiptRatio: json['taxReceiptRatio'],
      issueTaxReceipt: json['issueTaxReceipt'],
      donationCampaign: json['donationCampaign'],
      icon: CampaignIcon.fromJson(json['icon'] ?? {}),
      allowRecurringModification: json['allowRecurringModification'],
      frequency: (json['frequency'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      amounts:
          (json['amounts'] as List<dynamic>?)?.map((e) => e as num).toList() ??
              [],
      nodes: List<CampaignNode>.from(
        (json['nodes'] as List<dynamic>?)?.map(
              (node) => CampaignNode.fromJson(node),
            ) ??
            [],
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'tagNumber': tagNumber,
      'name': name,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'status': status,
      'hidden': hidden,
      'targetAmount': targetAmount,
      'minimumAmount': minimumAmount,
      'sortOrder': sortOrder,
      'taxReceiptRatio': taxReceiptRatio,
      'fees': fees,
      'enableQuantity': enableQuantity,
      'issueTaxReceipt': issueTaxReceipt,
      'allowRecurringModification': allowRecurringModification,
      'donationCampaign': donationCampaign,
      'raisedAmount': raisedAmount,
      'currencySymbol': currencySymbol,
      'qrCode': qrCode,
      'icon': icon?.toJson() ?? {},
      'nodes': nodes?.map((node) => node.toJson()).toList() ?? [],
    };
  }
}

class CampaignIcon {
  num? tagNumber;
  String? filename;
  num? width;
  num? height;
  String? tags;

  CampaignIcon({
    this.tagNumber,
    this.filename,
    this.width,
    this.height,
    this.tags,
  });

  factory CampaignIcon.fromJson(Map<String, dynamic> json) {
    return CampaignIcon(
      tagNumber: json['tagNumber'],
      filename: json['filename'],
      width: json['width'],
      height: json['height'],
      tags: json['tags'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tagNumber': tagNumber,
      'filename': filename,
      'width': width,
      'height': height,
      'tags': tags,
    };
  }
}

class CampaignNode {
  num? tagNumber;
  num? nodeTag;
  String? organizationDefinedName;
  bool? active;
  bool? status;

  CampaignNode({
    this.tagNumber,
    this.nodeTag,
    this.organizationDefinedName,
    this.active,
    this.status,
  });

  factory CampaignNode.fromJson(Map<String, dynamic> json) {
    return CampaignNode(
      tagNumber: json['tagNumber'],
      nodeTag: json['nodeTag'],
      organizationDefinedName: json['organizationDefinedName'],
      active: json['active'],
      status: json['status'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'tagNumber': tagNumber,
      'nodeTag': nodeTag,
      'organizationDefinedName': organizationDefinedName,
      'active': active,
      'status': status,
    };
  }
}
