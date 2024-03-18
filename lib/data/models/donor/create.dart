import '/core/app_export.dart';

class DonorCreateReq {
  String? firstName;
  String? middleInitials;
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

  DonorCreateReq({
    this.firstName,
    this.middleInitials,
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

  factory DonorCreateReq.fromJson(Map<String, dynamic> json) {
    return DonorCreateReq(
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
