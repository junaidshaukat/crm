import 'dart:typed_data';

import '/core/app_export.dart';

class QrReadReq {
  String? data;
  String? size;
  String? name;

  QrReadReq({
    this.data,
    this.name,
    this.size = '600',
  });

  factory QrReadReq.fromJson(Map<String, dynamic> json) {
    return QrReadReq(
      data: json['data'],
      name: json['name'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': "$data${name?.replaceAll(RegExp(r"\s+"), "").toLowerCase()}",
      'size': size,
    };
  }
}

class QrReadRes {
  String? instanceId;
  bool? result;
  String? message;
  String? fileName;
  String? mimeType;
  MessageDetails? messageDetails;
  Uint8List? data;

  QrReadRes({
    this.instanceId,
    this.result,
    this.message,
    this.fileName,
    this.mimeType,
    this.messageDetails,
    this.data,
  });

  String extractFilenameFromContentDisposition(String contentDisposition) {
    final regex = RegExp('filename=(".*")');
    final match = regex.firstMatch(contentDisposition);
    if (match != null) {
      return match.group(1)!.replaceAll('"', '');
    }
    return '';
  }

  factory QrReadRes.fromJson(Uint8List? json, {Response? response}) {
    if (json != null) {
      Map<String, List<String>> headers = response!.headers.map;
      dynamic disposition = headers['content-disposition'];
      dynamic contentType = headers['content-type'];
      console.log(headers, name: 'headers');
      return QrReadRes(
        result: true,
        fileName: disposition[0],
        mimeType: contentType[0],
        message: 'ok',
        data: json,
      );
    }
    return QrReadRes(
      result: false,
      message: 'error',
      data: json,
    );
  }
}
