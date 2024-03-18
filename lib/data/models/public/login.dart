import '/core/app_export.dart';

class LoginReq {
  String? email;
  String? password;

  LoginReq({this.email, this.password});

  LoginReq.fromJson(Map<String, dynamic> json) {
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

class LoginRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  LoginResData? data;

  LoginRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  LoginRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? LoginResData.fromJson(json['data']) : null;
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

class LoginResData {
  dynamic tagNumber;
  dynamic organizationTag;
  String? firstName;
  String? lastName;
  String? email;
  String? language;
  String? token;
  String? tokenType;
  int? tokenValidity;
  List<LoginResOrganizations>? organizations;

  LoginResData(
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

  LoginResData.fromJson(Map<String, dynamic> json) {
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
      organizations = <LoginResOrganizations>[];
      json['organizations'].forEach((v) {
        organizations?.add(LoginResOrganizations.fromJson(v));
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

class LoginResOrganizations {
  int? tagNumber;
  String? name;
  String? location;
  bool? status;
  int? gatewayNodeTag;
  int? eCheckNodeTag;
  String? currencySymbol;

  LoginResOrganizations(
      {this.tagNumber,
      this.name,
      this.location,
      this.status,
      this.gatewayNodeTag,
      this.eCheckNodeTag,
      this.currencySymbol});

  LoginResOrganizations.fromJson(Map<String, dynamic> json) {
    tagNumber = json['tagNumber'];
    name = json['name'];
    location = json['location'];
    status = json['status'];
    gatewayNodeTag = json['gatewayNodeTag'];
    eCheckNodeTag = json['eCheckNodeTag'];
    currencySymbol = json['currencySymbol'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (tagNumber != null) {
      data['tagNumber'] = tagNumber;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (location != null) {
      data['location'] = location;
    }
    if (status != null) {
      data['status'] = status;
    }
    if (gatewayNodeTag != null) {
      data['gatewayNodeTag'] = gatewayNodeTag;
    }
    if (eCheckNodeTag != null) {
      data['eCheckNodeTag'] = eCheckNodeTag;
    }
    if (currencySymbol != null) {
      data['currencySymbol'] = currencySymbol;
    }
    return data;
  }
}
