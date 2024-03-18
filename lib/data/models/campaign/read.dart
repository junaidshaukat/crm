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
  num? tagNumber;
  String? name;
  String? description;
  String? startDate;
  String? endDate;
  bool? status;
  num? targetAmount;
  num? minimumAmount;
  num? sortOrder;
  num? fees;
  bool? issueTaxReceipt;
  bool? donationCampaign;
  num? raisedAmount;
  String? currencySymbol;
  String? qrCode;
  CampaignIcon? icon;
  List<CampaignNode>? nodes;

  CampaignData({
    this.tagNumber,
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.status,
    this.targetAmount,
    this.minimumAmount,
    this.sortOrder,
    this.fees,
    this.issueTaxReceipt,
    this.donationCampaign,
    this.raisedAmount,
    this.currencySymbol,
    this.qrCode,
    this.icon,
    this.nodes,
  });

  factory CampaignData.fromJson(Map<String, dynamic> json) {
    return CampaignData(
      tagNumber: json['tagNumber'],
      name: json['name'],
      description: json['description'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
      targetAmount: json['targetAmount'],
      minimumAmount: json['minimumAmount'],
      sortOrder: json['sortOrder'],
      fees: json['fees'],
      issueTaxReceipt: json['issueTaxReceipt'],
      donationCampaign: json['donationCampaign'],
      raisedAmount: json['raisedAmount'],
      currencySymbol: json['currencySymbol'],
      qrCode: json['qrCode'],
      icon: CampaignIcon.fromJson(json['icon'] ?? {}),
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
      'targetAmount': targetAmount,
      'minimumAmount': minimumAmount,
      'sortOrder': sortOrder,
      'fees': fees,
      'issueTaxReceipt': issueTaxReceipt,
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
