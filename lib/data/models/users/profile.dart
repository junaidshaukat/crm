import '/core/app_export.dart';

class UserProfileRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  UserData? data;

  UserProfileRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory UserProfileRes.fromJson(Map<String, dynamic> json) {
    return UserProfileRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'messageDetails': messageDetails,
      'data': data?.toJson(),
    };
  }
}

class UserData {
  num? tagNumber;
  num? organizationTag;
  String? email;
  String? firstName;
  String? lastName;
  bool? status;
  String? language;
  String? role;
  String? createDateTime;
  String? updateDateTime;
  List<UserOrganization>? organizations;

  UserData({
    this.tagNumber,
    this.organizationTag,
    this.email,
    this.firstName,
    this.lastName,
    this.status,
    this.language,
    this.role,
    this.createDateTime,
    this.updateDateTime,
    this.organizations,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      tagNumber: json['tagNumber'],
      organizationTag: json['organizationTag'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      status: json['status'],
      language: json['language'],
      role: json['role'],
      createDateTime: json['createDateTime'],
      updateDateTime: json['updateDateTime'],
      organizations: json['organizations'] != null ? (json['organizations'] as List<dynamic>).map((org) => UserOrganization.fromJson(org)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tagNumber': tagNumber,
      'organizationTag': organizationTag,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'status': status,
      'language': language,
      'role': role,
      'createDateTime': createDateTime,
      'updateDateTime': updateDateTime,
      'organizations': organizations?.map((org) => org.toJson()).toList(),
    };
  }
}

class UserOrganization {
  num? tagNumber;
  String? name;
  String? location;
  bool? status;
  num? gatewayNodeTag;
  num? eCheckNodeTag;
  String? currencySymbol;

  UserOrganization({
    this.tagNumber,
    this.name,
    this.location,
    this.status,
    this.gatewayNodeTag,
    this.eCheckNodeTag,
    this.currencySymbol,
  });

  factory UserOrganization.fromJson(Map<String, dynamic> json) {
    return UserOrganization(
      tagNumber: json['tagNumber'],
      name: json['name'],
      location: json['location'],
      status: json['status'],
      gatewayNodeTag: json['gatewayNodeTag'],
      eCheckNodeTag: json['eCheckNodeTag'],
      currencySymbol: json['currencySymbol'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tagNumber': tagNumber,
      'name': name,
      'location': location,
      'status': status,
      'gatewayNodeTag': gatewayNodeTag,
      'eCheckNodeTag': eCheckNodeTag,
      'currencySymbol': currencySymbol,
    };
  }
}
