import '/core/app_export.dart';

class DonorsAndFollowersReq {
  DonorsAndFollowersReq();

  DonorsAndFollowersReq.fromJson(Map<String, dynamic> json) {
    DonorsAndFollowersReq();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}

class DonorsAndFollowersRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  DonorsAndFollowers? data;

  DonorsAndFollowersRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  DonorsAndFollowersRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? DonorsAndFollowers.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (instanceId != null) {
      data['instanceId'] = instanceId;
    }
    if (result != null) {
      data['result'] = result;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (messageDetails != null) {
      data['messageDetails'] = messageDetails;
    }
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class DonorsAndFollowers {
  num? followers;
  num? donors;

  DonorsAndFollowers({this.followers, this.donors});

  DonorsAndFollowers.fromJson(Map<String, dynamic> json) {
    followers = json['followers'];
    donors = json['donors'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (followers != null) {
      data['followers'] = followers;
    }
    if (donors != null) {
      data['donors'] = donors;
    }

    return data;
  }
}
