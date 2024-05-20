import '/core/app_export.dart';

class MediaReq {
  int? page;
  int? pageSize;
  String? by;
  String? order;

  MediaReq({
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

class MediaRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  MediaLinks? links;
  List<MediaData>? data;

  MediaRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.links,
    this.data,
  });

  factory MediaRes.fromJson(Map<String, dynamic> json) {
    return MediaRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      links: json['links'] != null ? MediaLinks.fromJson(json['links']) : null,
      data: json['data'] != null
          ? List<MediaData>.from(json['data'].map((x) => MediaData.fromJson(x)))
          : null,
    );
  }
}

class MediaLinks {
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

  MediaLinks({
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

  factory MediaLinks.fromJson(Map<String, dynamic> json) {
    return MediaLinks(
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

class MediaData {
  int tagNumber;
  int organizationTag;
  String name;
  String description;
  String url;
  String path;
  String mediaType;
  bool isMuted;
  int duration;
  int sortOrder;
  bool fullScreen;
  bool status;
  String createDateTime;
  String updateDateTime;

  MediaData({
    this.tagNumber = 0,
    this.organizationTag = 0,
    this.name = '',
    this.description = '',
    this.url = '',
    this.path = '',
    this.mediaType = '',
    this.isMuted = true,
    this.duration = 15,
    this.sortOrder = 0,
    this.fullScreen = false,
    this.status = false,
    this.createDateTime = '',
    this.updateDateTime = '',
  });

  factory MediaData.fromJson(Map<String, dynamic> json) {
    return MediaData(
      tagNumber: json['tagNumber'],
      organizationTag: json['organizationTag'],
      name: json['name'],
      description: json['description'],
      url: json['url'],
      path: json['path'],
      mediaType: json['mediaType'],
      isMuted: json['isMuted'],
      duration: json['duration'],
      sortOrder: json['sortOrder'],
      fullScreen: json['fullScreen'],
      status: json['status'],
      createDateTime: json['createDateTime'],
      updateDateTime: json['updateDateTime'],
    );
  }

  Map<String, dynamic> toJson() {
    final temp = <String, dynamic>{};
    temp['tagNumber'] = tagNumber;
    temp['organizationTag'] = organizationTag;
    temp['name'] = name;
    temp['description'] = description;
    temp['url'] = url;
    temp['mediaType'] = mediaType;
    temp['path'] = path;
    temp['isMuted'] = isMuted;
    temp['duration'] = duration;
    temp['sortOrder'] = sortOrder;
    temp['fullScreen'] = fullScreen;
    temp['status'] = status;
    temp['updateDateTime'] = updateDateTime;
    temp['createDateTime'] = createDateTime;

    return temp;
  }
}
