import '/core/app_export.dart';

class UsersReadRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  List<Users>? data;

  UsersReadRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory UsersReadRes.fromJson(Map<String, dynamic> json) {
    return UsersReadRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null ? (json['data'] as List<dynamic>).map((user) => Users.fromJson(user)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'messageDetails': messageDetails,
      'data': data?.map((user) => user.toJson()).toList(),
    };
  }
}

class Users {
  num? tagNumber;
  num? organizationTag;
  String? email;
  String? firstName;
  String? lastName;
  bool? status;
  String? language;
  String? role;
  String? accountPassword;
  String? createDateTime;
  String? updateDateTime;
  List<Organization>? organizations;

  Users({
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
    this.accountPassword,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      tagNumber: json['tagNumber'],
      organizationTag: json['organizationTag'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      status: json['status'],
      language: json['language'],
      role: json['role'],
      accountPassword: json['accountPassword'],
      createDateTime: json['createDateTime'],
      updateDateTime: json['updateDateTime'],
      organizations: json['organizations'] != null ? (json['organizations'] as List<dynamic>).map((org) => Organization.fromJson(org)).toList() : null,
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
      'accountPassword': accountPassword,
      'createDateTime': createDateTime,
      'updateDateTime': updateDateTime,
      'organizations': organizations?.map((org) => org.toJson()).toList(),
    };
  }
}

class Organization {
  num? tagNumber;
  String? name;
  String? location;
  bool? status;
  num? gatewayNodeTag;
  num? eCheckNodeTag;
  String? currencySymbol;

  Organization({
    this.tagNumber,
    this.name,
    this.location,
    this.status,
    this.gatewayNodeTag,
    this.eCheckNodeTag,
    this.currencySymbol,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
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
