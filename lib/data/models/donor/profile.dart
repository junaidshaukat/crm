import '/core/app_export.dart';

class UpdateProfileImageReq {
  String? tagNumber;
  String? profileImage;

  UpdateProfileImageReq({
    this.tagNumber,
    this.profileImage,
  });

  factory UpdateProfileImageReq.fromJson(Map<String, dynamic> json) {
    return UpdateProfileImageReq(
      tagNumber: json['tagNumber'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "tagNumber": tagNumber ?? '',
      "profileImage": profileImage ?? '',
    };
  }
}

class UpdateProfileImageRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  String? data;

  UpdateProfileImageRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory UpdateProfileImageRes.fromJson(Map<String, dynamic> json) {
    return UpdateProfileImageRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'],
    );
  }
}

class DeleteProfileImageReq {
  String? tagNumber;

  DeleteProfileImageReq({
    this.tagNumber,
  });

  factory DeleteProfileImageReq.fromJson(Map<String, dynamic> json) {
    return DeleteProfileImageReq(
      tagNumber: json['tagNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "tagNumber": tagNumber ?? '',
    };
  }
}

class DeleteProfileImageRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  String? data;

  DeleteProfileImageRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory DeleteProfileImageRes.fromJson(Map<String, dynamic> json) {
    return DeleteProfileImageRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'],
    );
  }
}
