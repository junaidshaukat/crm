import '/core/app_export.dart';

class ProfileReq {
  String? email;
  String? password;

  ProfileReq({this.email, this.password});

  ProfileReq.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (email != null) {
      data['email'] = email;
    }
    if (password != null) {
      data['password'] = password;
    }
    return data;
  }
}

class ProfileRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  ProfileData? data;

  ProfileRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  ProfileRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
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

class ProfileData {
  int? tagNumber;
  int? organizationTag;
  String? firstName;
  String? lastName;
  String? email;
  String? language;
  String? token;
  String? tokenType;
  int? tokenValidity;
  List<Organizations>? organizations;

  ProfileData(
      {this.tagNumber,
      this.organizationTag,
      this.firstName,
      this.lastName,
      this.email,
      this.language,
      this.token,
      this.tokenType,
      this.tokenValidity,
      this.organizations});

  ProfileData.fromJson(Map<String, dynamic> json) {
    tagNumber = json['tagNumber'];
    organizationTag = json['organizationTag'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    language = json['language'];
    token = json['token'];
    tokenType = json['tokenType'];
    tokenValidity = json['tokenValidity'];
    if (json['organizations'] != null) {
      organizations = <Organizations>[];
      json['organizations'].forEach((v) {
        organizations?.add(Organizations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (tagNumber != null) {
      data['tagNumber'] = tagNumber;
    }
    if (organizationTag != null) {
      data['organizationTag'] = organizationTag;
    }
    if (firstName != null) {
      data['firstName'] = firstName;
    }
    if (lastName != null) {
      data['lastName'] = lastName;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (language != null) {
      data['language'] = language;
    }
    if (token != null) {
      data['token'] = token;
    }
    if (tokenType != null) {
      data['tokenType'] = tokenType;
    }
    if (tokenValidity != null) {
      data['tokenValidity'] = tokenValidity;
    }
    if (organizations != null) {
      data['organizations'] = organizations?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
