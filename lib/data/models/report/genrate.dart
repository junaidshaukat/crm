import 'dart:typed_data';
import '/core/app_export.dart';

class ReportGenrateReq {
  num? reportTag;
  String? pFormat;
  String? pFrom;
  String? pTo;
  List<String?> pStatus;

  ReportGenrateReq({
    this.reportTag,
    this.pFormat,
    this.pFrom,
    this.pTo,
    this.pStatus = const [],
  });

  factory ReportGenrateReq.fromJson(Map<String, dynamic> json) {
    return ReportGenrateReq(
      reportTag: json['reportTag'],
      pFormat: json['pFormat'] ?? '',
      pFrom: json['pFrom'] ?? '',
      pTo: json['pTo'] ?? '',
      pStatus: json['pStatus'] ?? [],
    );
  }

  Map<String, dynamic> toJson({required Map<String, dynamic> filter}) {
    Map<String, dynamic> data = {};

    if (reportTag != null) {
      data['reportTag'] = reportTag;
    }

    if (pFormat != null && pFormat!.isNotEmpty) {
      data['pFormat'] = pFormat;
    }

    if (pFrom != null && pFrom!.isNotEmpty) {
      data['pFrom'] = pFrom;
    }

    if (pTo != null && pTo!.isNotEmpty) {
      data['pTo'] = pTo;
    }

    if (pStatus.isNotEmpty) {
      data['pStatus'] = pStatus;
    }

    data.addAll(filter);

    return data;
  }
}

class ReportGenrateRes {
  String? instanceId;
  bool? result;
  String? message;
  String? fileName;
  String? mimeType;
  MessageDetails? messageDetails;
  Uint8List? data;

  ReportGenrateRes({
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

  factory ReportGenrateRes.fromJson(Uint8List? json, {Response? response}) {
    if (json != null) {
      Map<String, List<String>> headers = response!.headers.map;
      dynamic disposition = headers['content-disposition'];
      dynamic contentType = headers['content-type'];
      console.log(headers, name: 'headers');
      return ReportGenrateRes(
        result: true,
        fileName: disposition[0],
        mimeType: contentType[0],
        message: 'ok',
        data: json,
      );
    }
    return ReportGenrateRes(
      result: false,
      message: 'error',
      data: json,
    );
  }
}
