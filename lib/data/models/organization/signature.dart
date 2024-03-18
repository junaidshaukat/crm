import '/core/app_export.dart';

class OrganizationSignatureUpdateReq {
  String? name;
  String? phone;
  String? email;
  String? website;
  String? streetAddress;
  String? unitNumber;
  String? city;
  String? country;
  String? provinceState;
  String? postalZipCode;
  String? locationName;
  String? receiptAlertEmail;
  String? receiptFooter;
  String? footerNote;
  String? forceRegistration;
  String? charityOrganization;
  String? charityStreetAddress;
  String? charityUnitNumber;
  String? charityCity;
  String? charityProvinceState;
  String? charityPostalZipCode;
  String? charityRegistrationNumber;
  String? taxReceiptFooter;
  String? taxReceiptStart;
  String? contactName;
  String? contactEmail;
  String? contactPhone;

  OrganizationSignatureUpdateReq({
    this.name,
    this.phone,
    this.email,
    this.website,
    this.streetAddress,
    this.unitNumber,
    this.city,
    this.country,
    this.provinceState,
    this.postalZipCode,
    this.locationName,
    this.receiptAlertEmail,
    this.receiptFooter,
    this.footerNote,
    this.forceRegistration,
    this.charityOrganization,
    this.charityStreetAddress,
    this.charityUnitNumber,
    this.charityCity,
    this.charityProvinceState,
    this.charityPostalZipCode,
    this.charityRegistrationNumber,
    this.taxReceiptFooter,
    this.taxReceiptStart,
    this.contactName,
    this.contactEmail,
    this.contactPhone,
  });

  factory OrganizationSignatureUpdateReq.fromJson(Map<String, dynamic> json) {
    return OrganizationSignatureUpdateReq(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      website: json['website'],
      streetAddress: json['streetAddress'],
      unitNumber: json['unitNumber'],
      city: json['city'],
      country: json['country'],
      provinceState: json['provinceState'],
      postalZipCode: json['postalZipCode'],
      locationName: json['locationName'],
      receiptAlertEmail: json['receiptAlertEmail'],
      receiptFooter: json['receiptFooter'],
      footerNote: json['footerNote'],
      forceRegistration: json['forceRegistration'],
      charityOrganization: json['charityOrganization'],
      charityStreetAddress: json['charityStreetAddress'],
      charityUnitNumber: json['charityUnitNumber'],
      charityCity: json['charityCity'],
      charityProvinceState: json['charityProvinceState'],
      charityPostalZipCode: json['charityPostalZipCode'],
      charityRegistrationNumber: json['charityRegistrationNumber'],
      taxReceiptFooter: json['taxReceiptFooter'],
      taxReceiptStart: json['taxReceiptStart'],
      contactName: json['contactName'],
      contactEmail: json['contactEmail'],
      contactPhone: json['contactPhone'],
    );
  }
}

class OrganizationSignatureUpdateRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  OrganizationSignatureUpdateData? data;

  OrganizationSignatureUpdateRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory OrganizationSignatureUpdateRes.fromJson(Map<String, dynamic> json) {
    return OrganizationSignatureUpdateRes(
      instanceId: json['instanceId'] ?? '',
      result: json['result'] ?? false,
      message: json['message'] ?? '',
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: OrganizationSignatureUpdateData.fromJson(json['data'] ?? {}),
    );
  }
}

class OrganizationSignatureUpdateData {
  String? signatureImage;
  String? signatureImageType;
  String? signatureImageBytes;

  OrganizationSignatureUpdateData({
    this.signatureImage,
    this.signatureImageType,
    this.signatureImageBytes,
  });

  factory OrganizationSignatureUpdateData.fromJson(Map<String, dynamic> json) {
    return OrganizationSignatureUpdateData(
      signatureImage: json['signatureImage'] ?? '',
      signatureImageType: json['signatureImageType'] ?? '',
      signatureImageBytes: json['signatureImageBytes'] ?? '',
    );
  }
}
