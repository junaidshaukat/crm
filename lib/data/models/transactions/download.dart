import 'dart:typed_data';

import '/core/app_export.dart';

class TransactionExportReq {
  String? by;
  String? order;
  num? page;
  num? pageSize;
  Map<String, String>? filter;

  TransactionExportReq({
    this.by = "transaction_tag",
    this.order,
    this.page,
    this.pageSize,
    this.filter = const {},
  });

  factory TransactionExportReq.fromJson(Map<String, dynamic> json) {
    return TransactionExportReq(
      by: json['by'],
      order: json['order'],
      page: json['page'],
      pageSize: json['pageSize'],
      filter: json['filter'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (by != null) {
      data['by'] = by;
    }
    if (order != null) {
      data['order'] = order;
    }
    if (page != null) {
      data['page'] = page;
    }
    if (pageSize != null) {
      data['pageSize'] = pageSize;
    }
    if (filter != null) {
      data.addAll(filter!);
    }
    return data;
  }
}

class TransactionExportRes {
  String? instanceId;
  bool? result;
  String? message;
  String? fileName;
  String? mimeType;
  MessageDetails? messageDetails;
  Uint8List? data;

  TransactionExportRes({
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

  factory TransactionExportRes.fromJson(Uint8List? json, {Response? response}) {
    if (json != null) {
      Map<String, List<String>> headers = response!.headers.map;
      dynamic disposition = headers['content-disposition'];
      dynamic contentType = headers['content-type'];
      console.log(headers, name: 'headers');
      return TransactionExportRes(
        result: true,
        fileName: disposition[0],
        mimeType: contentType[0],
        message: 'ok',
        data: json,
      );
    }
    return TransactionExportRes(
      result: false,
      message: 'error',
      data: json,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'fileName': fileName,
      'mimeType': mimeType,
      'messageDetails': messageDetails,
      'data': data,
    };
  }
}
