import '/core/app_export.dart';

class OrganizationProfileUpdateReq {
  String? name;
  String? phone;
  String? email;
  String? website;

  OrganizationProfileUpdateReq({
    this.name,
    this.phone,
    this.email,
    this.website,
  });

  Map<String, dynamic> toJson(Map<String, dynamic> data) {
    return {
      'charityCity': data['charityCity'],
      'charityOrganization': data['charityOrganization'],
      'charityPostalZipCode': data['charityPostalZipCode'],
      'charityProvinceState': data['charityProvinceState'],
      'charityRegistrationNumber': data['charityRegistrationNumber'],
      'charityStreetAddress': data['charityStreetAddress'],
      'charityUnitNumber': data['charityUnitNumber'],
      'city': data['city'],
      'contactEmail': data['contactEmail'],
      'contactName': data['contactName'],
      'contactPhone': data['contactPhone'],
      'country': data['country'],
      'createDateTime': data['createDateTime'],
      'email': email,
      'footerNote': data['footerNote'],
      'forceRegistration': data['forceRegistration'],
      'generateSignature': data['generateSignature'],
      'locationName': data['locationName'],
      'logo': data['logo'],
      'name': name,
      'phone': phone,
      'portalUrl': data['portalUrl'],
      'postalZipCode': data['postalZipCode'],
      'provinceState': data['provinceState'],
      'receiptAlertEmail': data['receiptAlertEmail'],
      'receiptFooter': data['receiptFooter'],
      'shortName': data['shortName'],
      'signatureImage': data['signatureImage'],
      'signatureImageBytes': data['signatureImageBytes'],
      'signatureImageType': data['signatureImageType'],
      'signupDate': data['signupDate'],
      'streetAddress': data['streetAddress'],
      'tagNumber': data['tagNumber'],
      'taxReceiptFooter': data['taxReceiptFooter'],
      'taxReceiptStart': data['taxReceiptStartDate'],
      'timezone': data['timezone'],
      'unitNumber': data['unitNumber'],
      'updateDateTime': data['updateDateTime'],
      'website': website,
    };
  }
}

class OrganizationProfileUpdateRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  OrganizationProfileUpdateData? data;

  OrganizationProfileUpdateRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory OrganizationProfileUpdateRes.fromJson(Map<String, dynamic> json) {
    return OrganizationProfileUpdateRes(
      instanceId: json['instanceId'] ?? '',
      result: json['result'] ?? false,
      message: json['message'] ?? '',
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: OrganizationProfileUpdateData.fromJson(json['data'] ?? {}),
    );
  }
}

class OrganizationProfileUpdateData {
  int? tagNumber;
  String? name;
  String? logo;
  String? streetAddress;
  String? unitNumber;
  String? city;
  String? provinceState;
  String? postalZipCode;
  String? country;
  String? phone;
  String? website;
  String? email;
  String? footerNote;
  String? charityOrganization;
  String? charityStreetAddress;
  String? charityUnitNumber;
  String? charityCity;
  String? charityProvinceState;
  String? charityPostalZipCode;
  String? charityRegistrationNumber;
  String? taxReceiptFooter;
  String? generateSignature;
  String? signatureImage;
  String? signatureImageType;
  String? contactName;
  String? contactPhone;
  String? contactEmail;
  String? signupDate;
  String? timezone;
  String? locationName;
  String? shortName;
  String? taxReceiptStartDate;
  String? receiptFooter;
  String? receiptAlertEmail;
  String? portalUrl;
  String? forceRegistration;
  String? createDateTime;
  String? updateDateTime;
  String? signatureImageBytes;

  OrganizationProfileUpdateData({
    this.tagNumber,
    this.name,
    this.logo,
    this.streetAddress,
    this.unitNumber,
    this.city,
    this.provinceState,
    this.postalZipCode,
    this.country,
    this.phone,
    this.website,
    this.email,
    this.footerNote,
    this.charityOrganization,
    this.charityStreetAddress,
    this.charityUnitNumber,
    this.charityCity,
    this.charityProvinceState,
    this.charityPostalZipCode,
    this.charityRegistrationNumber,
    this.taxReceiptFooter,
    this.generateSignature,
    this.signatureImage,
    this.signatureImageType,
    this.contactName,
    this.contactPhone,
    this.contactEmail,
    this.signupDate,
    this.timezone,
    this.locationName,
    this.shortName,
    this.taxReceiptStartDate,
    this.receiptFooter,
    this.receiptAlertEmail,
    this.portalUrl,
    this.forceRegistration,
    this.createDateTime,
    this.updateDateTime,
    this.signatureImageBytes,
  });

  factory OrganizationProfileUpdateData.fromJson(Map<String, dynamic> json) {
    return OrganizationProfileUpdateData(
      tagNumber: json['tagNumber'] ?? 0,
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      streetAddress: json['streetAddress'] ?? '',
      unitNumber: json['unitNumber'] ?? '',
      city: json['city'] ?? '',
      provinceState: json['provinceState'] ?? '',
      postalZipCode: json['postalZipCode'] ?? '',
      country: json['country'] ?? '',
      phone: json['phone'] ?? '',
      website: json['website'] ?? '',
      email: json['email'] ?? '',
      footerNote: json['footerNote'] ?? '',
      charityOrganization: json['charityOrganization'] ?? '',
      charityStreetAddress: json['charityStreetAddress'] ?? '',
      charityUnitNumber: json['charityUnitNumber'],
      charityCity: json['charityCity'] ?? '',
      charityProvinceState: json['charityProvinceState'] ?? '',
      charityPostalZipCode: json['charityPostalZipCode'] ?? '',
      charityRegistrationNumber: json['charityRegistrationNumber'] ?? '',
      taxReceiptFooter: json['taxReceiptFooter'] ?? '',
      generateSignature: json['generateSignature'] ?? '',
      signatureImage: json['signatureImage'] ?? '',
      signatureImageType: json['signatureImageType'] ?? '',
      contactName: json['contactName'] ?? '',
      contactPhone: json['contactPhone'] ?? '',
      contactEmail: json['contactEmail'] ?? '',
      signupDate: json['signupDate'] ?? '',
      timezone: json['timezone'] ?? '',
      locationName: json['locationName'] ?? '',
      shortName: json['shortName'] ?? '',
      taxReceiptStartDate: json['taxReceiptStartDate'] ?? '',
      receiptFooter: json['receiptFooter'] ?? '',
      receiptAlertEmail: json['receiptAlertEmail'],
      portalUrl: json['portalUrl'] ?? '',
      forceRegistration: json['forceRegistration'] ?? '',
      createDateTime: json['createDateTime'] ?? '',
      updateDateTime: json['updateDateTime'] ?? '',
      signatureImageBytes: json['signatureImageBytes'] ?? '',
    );
  }
}
