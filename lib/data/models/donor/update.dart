import '/core/app_export.dart';

class DonorUpdateReq {
  String? tagNumber;
  String? firstName;
  String? middleName;
  String? lastName;
  String? streetAddress;
  String? unitNumber;
  String? city;
  String? postalZipCode;
  String? provinceState;
  String? country;
  String? email;
  String? accountPassword;
  String? phone;
  String? status;
  String? allowContact;
  String? notifyNewCampaign;

  DonorUpdateReq({
    this.tagNumber,
    this.firstName,
    this.middleName,
    this.lastName,
    this.streetAddress,
    this.unitNumber,
    this.city,
    this.postalZipCode,
    this.provinceState,
    this.country,
    this.email,
    this.accountPassword,
    this.phone,
    this.status = '1',
    this.allowContact = '1',
    this.notifyNewCampaign = '1',
  });

  factory DonorUpdateReq.fromJson(Map<String, dynamic> json) {
    return DonorUpdateReq(
      tagNumber: json['tagNumber'],
      firstName: json['firstName'],
      middleName: json['middleName'],
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
      'tagNumber': tagNumber,
      "firstName": firstName,
      "middleName": middleName,
      "lastName": lastName,
      "streetAddress": streetAddress,
      "unitNumber": unitNumber,
      "city": city,
      "postalZipCode": postalZipCode,
      "provinceState": provinceState,
      "country": country,
      "email": email,
      'accountPassword': accountPassword,
      "phone": phone,
      "status": status,
      "allowContact": allowContact,
      "notifyNewCampaign": notifyNewCampaign,
    };
  }
}

class DonorUpdateRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  DonorData? data;

  DonorUpdateRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory DonorUpdateRes.fromJson(Map<String, dynamic> json) {
    return DonorUpdateRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: DonorData.fromJson(json['data']),
    );
  }
}
