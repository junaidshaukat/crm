import 'dart:io';

import '/core/app_export.dart';

class UpdateMediaReq {
  String? name;
  String? description;
  String? duration;
  String? sortOrder;
  bool? fullScreen;
  bool? status;
  bool? isMuted;
  File? mediaFile;

  UpdateMediaReq({
    this.name,
    this.description,
    this.duration,
    this.sortOrder,
    this.fullScreen = false,
    this.status = false,
    this.isMuted = false,
    this.mediaFile,
  });

  Map<String, dynamic> toJson({Map<String, String>? filter}) {
    final temp = <String, dynamic>{};

    if (name != null) {
      temp['name'] = name;
    }

    if (description != null) {
      temp['description'] = description;
    }

    if (duration != null) {
      temp['duration'] = duration;
    }

    if (sortOrder != null) {
      temp['sortOrder'] = sortOrder;
    }

    if (fullScreen != null) {
      temp['fullScreen'] = fullScreen.toString();
    }

    if (status != null) {
      temp['status'] = status.toString();
    }

    if (isMuted != null) {
      temp['isMuted'] = isMuted.toString();
    }

    if (mediaFile != null) {
      temp['mediaFile'] = mediaFile;
    }

    return temp;
  }
}

class UpdateMediaRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  MediaData? data;

  UpdateMediaRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory UpdateMediaRes.fromJson(Map<String, dynamic> json) {
    return UpdateMediaRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null ? MediaData.fromJson(json['data']) : null,
    );
  }
}
