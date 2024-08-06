import '/core/app_export.dart';

class DonorCreateReq {
  String? city;
String? email;
String? phone;
String? status;
String? country;
String? lastName;
String? firstName;
String? unitNumber;
String? accountType;
String? businessName;
String? allowContact;
String? streetAddress;
String? postalZipCode;
String? provinceState;
String? middleInitials;
String? accountPassword;
String? notifyNewCampaign;

  DonorCreateReq({
    this.city,
this.email,
this.phone,
this.country,
this.lastName,
this.firstName,
this.unitNumber,
this.accountType,
this.businessName,
this.status = '1',
this.streetAddress,
this.postalZipCode,
this.provinceState,
this.middleInitials,
this.accountPassword,
this.allowContact = '1',
this.notifyNewCampaign = '1',
  });

  factory DonorCreateReq.fromJson(Map<String, dynamic> json) {
    return DonorCreateReq(
      accountType: json['accountType'],
      businessName: json['businessName'],
      firstName: json['firstName'],
      middleInitials: json['middleInitials'],
      lastName: json['lastName'],
      streetAddress: json['streetAddress'],
      unitNumber: json['unitNumber'],
      city: json['city'],
      postalZipCode: json['postalZipCode'],
      provinceState: json['provinceState'],
      country: json['country'],
      email: json['email'],
      accountPassword: json['accountPassword'],
      phone: json['phone'],
      status: json['status'],
      allowContact: json['allowContact'],
      notifyNewCampaign: json['notifyNewCampaign'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "accountType": accountType ?? '',
      "businessName": businessName ?? '',
      "firstName": firstName ?? '',
      "middleInitials": middleInitials ?? '',
      "lastName": lastName ?? '',
      "streetAddress": streetAddress ?? '',
      "unitNumber": unitNumber ?? '',
      "city": city ?? '',
      "postalZipCode": postalZipCode ?? '',
      "provinceState": provinceState ?? '',
      "country": country ?? '',
      "email": email ?? '',
      'accountPassword': accountPassword ?? '',
      "phone": phone ?? '',
      "status": status ?? '1',
      "type": 'admin',
      "allowContact": allowContact ?? '1',
      "notifyNewCampaign": notifyNewCampaign ?? '1',
    };
  }
}

class DonorCreateRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  DonorData? data;

  DonorCreateRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory DonorCreateRes.fromJson(Map<String, dynamic> json) {
    return DonorCreateRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: DonorData.fromJson(json['data']),
    );
  }
}
