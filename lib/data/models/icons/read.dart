import '/core/app_export.dart';

class IconsReadRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  List<IconsData>? data;

  IconsReadRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory IconsReadRes.fromJson(Map<String, dynamic> json) {
    var dataJson = json['data'] as List<dynamic>?;

    List<IconsData>? iconDataList;
    if (dataJson != null) {
      iconDataList = dataJson.map((e) => IconsData.fromJson(e)).toList();
    }

    return IconsReadRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: iconDataList,
    );
  }
}

class IconsData {
  num? tagNumber;
  String? filename;
  num? width;
  num? height;
  String? tags;

  IconsData({
    this.tagNumber,
    this.filename,
    this.width,
    this.height,
    this.tags,
  });

  factory IconsData.fromJson(Map<String, dynamic> json) {
    return IconsData(
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
