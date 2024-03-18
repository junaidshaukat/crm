import '/core/app_export.dart';

class Validator {
  static String? email(String? input, {bool isRequired = true}) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_your_email".tr;
      } else if (input.isEmpty) {
        return "please_enter_your_email".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_your_email".tr;
      } else {
        return null;
      }
    }
  }

  static String? password(String? input, {bool isRequired = true}) {
    String pattern = r'^.{6,100}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_your_password".tr;
      } else if (input.isEmpty) {
        return "please_enter_your_password".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_your_password".tr;
      } else {
        return null;
      }
    }
  }

  static String? confirmPassword(String? input, String text,
      {bool isRequired = true}) {
    String pattern = r'^.{6,100}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_re_enter_your_password_for_confirmation".tr;
      } else if (input.isEmpty) {
        return "please_re_enter_your_password_for_confirmation".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_re_enter_your_password_for_confirmation".tr;
      } else if (input != text) {
        return "please_re_enter_your_password_for_confirmation".tr;
      } else {
        return null;
      }
    }
  }

  static String? otp(String? input, {bool isRequired = true}) {
    String pattern = r'^.{6}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_the_code_sent_to_your_email".tr;
      } else if (input.isEmpty) {
        return "please_enter_the_code_sent_to_your_email".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_the_code_sent_to_your_email".tr;
      } else {
        return null;
      }
    }
  }
}

class ValidatorCampaign {
  static String? name(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,50}$';
    RegExp regExp = RegExp(pattern);

    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"campaign".tr} ${"name".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"campaign".tr} ${"name".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"campaign".tr.toLowerCase()} ${"name".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? description(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,1000}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"campaign".tr} ${"description".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"campaign".tr} ${"description".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"Campaign".tr.toLowerCase()} ${"description".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? icon(String? input, {bool isRequired = true}) {
    String pattern = r'^\d*\.?\d+$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"campaign".tr} ${"icon".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"campaign".tr} ${"icon".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"campaign".tr.toLowerCase()} ${"icon".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? startDateAndTime(String? input, {bool isRequired = false}) {
    String pattern1 = r'^\d{4}-\d{2}-\d{2}\s\d{1,2}:\d{1,2}:\d{1,2}$';
    String pattern2 = r'^\d{4}-\d{1,2}-\d{1,2}\s\d{1,2}:\d{1,2}$';
    String pattern3 = r'^\d{4}-\d{1,2}-\d{1,2}$';

    RegExp regExp1 = RegExp(pattern1);
    RegExp regExp2 = RegExp(pattern2);
    RegExp regExp3 = RegExp(pattern3);

    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"campaign".tr} ${"start_date_and_time".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"campaign".tr} ${"start_date_and_time".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp1.hasMatch(input) &&
          !regExp2.hasMatch(input) &&
          !regExp3.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"start_date_and_time".tr.toLowerCase()} ${"icon".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? endDateAndTime(String? input, String? start,
      {bool isRequired = false}) {
    String pattern1 = r'^\d{4}-\d{2}-\d{2}\s\d{1,2}:\d{1,2}:\d{1,2}$';
    String pattern2 = r'^\d{4}-\d{1,2}-\d{1,2}\s\d{1,2}:\d{1,2}$';
    String pattern3 = r'^\d{4}-\d{1,2}-\d{1,2}$';

    RegExp regExp1 = RegExp(pattern1);
    RegExp regExp2 = RegExp(pattern2);
    RegExp regExp3 = RegExp(pattern3);

    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"campaign".tr} ${"end_date_and_time".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"campaign".tr} ${"end_date_and_time".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp1.hasMatch(input) &&
          !regExp2.hasMatch(input) &&
          !regExp3.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"end_date_and_time".tr.toLowerCase()} ${"icon".tr.toLowerCase()}";
      } else {
        if (start == null) {
          return "${"campaign".tr} ${"start_date_and_time".tr.toLowerCase()} ${"cannot_be_null".tr}";
        } else if (start.isEmpty) {
          return "${"campaign".tr} ${"start_date_and_time".tr.toLowerCase()} ${"cannot_be_empty".tr}";
        } else if (!regExp1.hasMatch(start) &&
            !regExp2.hasMatch(start) &&
            !regExp3.hasMatch(start)) {
          return "${"please_enter_valid".tr} ${"start_date_and_time".tr.toLowerCase()} ${"icon".tr.toLowerCase()}";
        } else {
          DateTime end = DateTime.parse(input);
          if (end.isBefore(DateTime.parse(start))) {
            return 'end_date_time_should_be_greater_than_start_date_time'.tr;
          }
          return null;
        }
      }
    }
  }

  static String? targetAmount(String? input, {bool isRequired = true}) {
    String pattern = r'^\d*\.?\d+$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"campaign".tr} ${"target_amount".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"campaign".tr} ${"target_amount".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"campaign".tr.toLowerCase()} ${"target_amount".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? minimumAmount(String? input, {bool isRequired = true}) {
    String pattern = r'^\d*\.?\d+$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"campaign".tr} ${"minimum_amount".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"campaign".tr} ${"minimum_amount".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"campaign".tr.toLowerCase()} ${"minimum_amount".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? fee(String? input, {bool isRequired = true}) {
    String pattern = r'^(100(\.0{1,2})?|\d{1,2}(\.\d{1,2})?|\.\d{1,2})$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"campaign".tr} ${"fee".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"campaign".tr} ${"fee".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"campaign".tr.toLowerCase()} ${"fee".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? sortOrder(String? input, {bool isRequired = true}) {
    String pattern = r'^(?:[1-9]\d{0,3}|10000)$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"campaign".tr} ${"sort_order".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"campaign".tr} ${"sort_order".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"campaign".tr.toLowerCase()} ${"sort_order".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }
}

class ValidatorDonor {
  static String? firstName(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,50}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"donor".tr} ${"first_name".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"donor".tr} ${"first_name".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"donor".tr.toLowerCase()} ${"first_name".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? middleName(String? input, {bool isRequired = false}) {
    String pattern = r'^.{1,50}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"donor".tr} ${"middle_name".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"donor".tr} ${"middle_name".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"donor".tr.toLowerCase()} ${"middle_name".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? lastName(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,50}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"donor".tr} ${"last_name".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"donor".tr} ${"last_name".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"donor".tr.toLowerCase()} ${"last_name".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? streetAddress(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,200}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"donor".tr} ${"street_address".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"donor".tr} ${"street_address".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"donor".tr.toLowerCase()} ${"street_address".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? unitNumber(String? input, {bool isRequired = false}) {
    String pattern = r'^.{1,10}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"donor".tr} ${"unit_number".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"donor".tr} ${"unit_number".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"donor".tr.toLowerCase()} ${"unit_number".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? city(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,50}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"donor".tr} ${"city".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"donor".tr} ${"city".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"donor".tr.toLowerCase()} ${"city".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? postalZipCode(String? input, {bool isRequired = false}) {
    String pattern = r'^.{1,20}$';
    RegExp regExp = RegExp(pattern);

    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"donor".tr} ${"postal_zip_code".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"donor".tr} ${"postal_zip_code".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"donor".tr.toLowerCase()} ${"postal_zip_code".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? province(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,100}$';
    RegExp regExp = RegExp(pattern);

    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"donor".tr} ${"province".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"donor".tr} ${"province".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"donor".tr.toLowerCase()} ${"province".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? country(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,100}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"donor".tr} ${"country".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"donor".tr} ${"country".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"donor".tr.toLowerCase()} ${"country".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? password(String? input, {bool isRequired = false}) {
    String pattern = r'^.{1,100}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"donor".tr} ${"password".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"donor".tr} ${"password".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"donor".tr.toLowerCase()} ${"password".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? phone(String? input, {bool isRequired = true}) {
    String pattern = r'^[0-9]*$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"donor".tr} ${"phone".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"donor".tr} ${"phone".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"donor".tr.toLowerCase()} ${"phone".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? email(String? input, {bool isRequired = true}) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"donor".tr} ${"email".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"donor".tr} ${"email".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"donor".tr.toLowerCase()} ${"email".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }
}

class ValidatorUser {
  static String? firstName(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,50}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"user".tr} ${"first_name".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"user".tr} ${"first_name".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"user".tr.toLowerCase()} ${"first_name".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? lastName(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,50}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"user".tr} ${"last_name".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"user".tr} ${"last_name".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"user".tr.toLowerCase()} ${"last_name".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? email(String? input, {bool isRequired = true}) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"user".tr} ${"email".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"user".tr} ${"email".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"user".tr.toLowerCase()} ${"email".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? password(String? input, {bool isRequired = true}) {
    String pattern = r'^.{6,100}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"user".tr} ${"password".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"user".tr} ${"password".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"user".tr.toLowerCase()} ${"password".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? status(String? input, {bool isRequired = false}) {
    String pattern = r'^.{1,100}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"user".tr} ${"password".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"user".tr} ${"password".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"user".tr.toLowerCase()} ${"password".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }
}

class ValidatorOrganization {
  static String? name(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,50}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"organization".tr} ${"name".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"organization".tr} ${"name".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"organization".tr.toLowerCase()} ${"name".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? email(String? input, {bool isRequired = true}) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"organization".tr} ${"email".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"organization".tr} ${"email".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"organization".tr.toLowerCase()} ${"email".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? phone(String? input, {bool isRequired = true}) {
    String pattern = r'^[0-9]*$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"organization".tr} ${"phone".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"organization".tr} ${"phone".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"organization".tr.toLowerCase()} ${"phone".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? website(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,100}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"organization".tr} ${"website".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"organization".tr} ${"website".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"organization".tr.toLowerCase()} ${"website".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? streetAddress(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,200}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"organization".tr} ${"street_address".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"organization".tr} ${"street_address".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"organization".tr.toLowerCase()} ${"street_address".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? unitNumber(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,10}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"organization".tr} ${"unit_number".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"organization".tr} ${"unit_number".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"organization".tr.toLowerCase()} ${"unit_number".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? city(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,50}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"organization".tr} ${"city".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"organization".tr} ${"city".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"organization".tr.toLowerCase()} ${"city".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? country(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,100}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"organization".tr} ${"country".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"organization".tr} ${"country".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"organization".tr.toLowerCase()} ${"country".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? postalZipCode(String? input, {bool isRequired = false}) {
    String pattern = r'^.{1,20}$';
    RegExp regExp = RegExp(pattern);

    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"organization".tr} ${"postal_zip_code".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"organization".tr} ${"postal_zip_code".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"organization".tr.toLowerCase()} ${"postal_zip_code".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? province(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,100}$';
    RegExp regExp = RegExp(pattern);

    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"organization".tr} ${"province".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"organization".tr} ${"province".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"organization".tr.toLowerCase()} ${"province".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? registerationNumber(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,200}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"organization".tr} ${"registeration_number".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"organization".tr} ${"registeration_number".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"organization".tr.toLowerCase()} ${"registeration_number".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? taxReceiptStartDate(String? input, {bool isRequired = true}) {
    String pattern1 = r'^\d{4}-\d{2}-\d{2}\s\d{1,2}:\d{1,2}:\d{1,2}$';
    String pattern2 = r'^\d{4}-\d{1,2}-\d{1,2}\s\d{1,2}:\d{1,2}$';
    String pattern3 = r'^\d{4}-\d{1,2}-\d{1,2}$';

    RegExp regExp1 = RegExp(pattern1);
    RegExp regExp2 = RegExp(pattern2);
    RegExp regExp3 = RegExp(pattern3);

    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"campaign".tr} ${"start_date_and_time".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"campaign".tr} ${"start_date_and_time".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp1.hasMatch(input) &&
          !regExp2.hasMatch(input) &&
          !regExp3.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"start_date_and_time".tr.toLowerCase()} ${"icon".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? taxReceiptFooter(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,200}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"organization".tr} ${"registeration_number".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"organization".tr} ${"registeration_number".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"organization".tr.toLowerCase()} ${"registeration_number".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }
}

class ValidatorMedia {
  static String? name(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,255}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"media".tr} ${"name".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"media".tr} ${"name".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"media".tr.toLowerCase()} ${"name".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? description(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,1000}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"media".tr} ${"description".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"media".tr} ${"description".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"media".tr.toLowerCase()} ${"description".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? duration(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,1000}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"media".tr} ${"duration".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"media".tr} ${"duration".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"media".tr.toLowerCase()} ${"duration".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? sortOrder(String? input, {bool isRequired = true}) {
    String pattern = r'^(?:[1-9]\d{0,3}|10000)$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"media".tr} ${"sort_order".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"media".tr} ${"sort_order".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"media".tr.toLowerCase()} ${"sort_order".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }
}

class ValidatorReport {
  static String capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }

  static String convertAndCapitalize(String input) {
    List<String> parts = input.split(" ");
    String firstPart = parts[0];
    String rest = parts.skip(1).map((part) => part.toLowerCase()).join(" ");
    return "${capitalize(firstPart)} $rest";
  }

  static String? date(String? input, String? label, {bool isRequired = false}) {
    String pattern1 = r'^\d{4}-\d{2}-\d{2}\s\d{1,2}:\d{1,2}:\d{1,2}$';
    String pattern2 = r'^\d{4}-\d{1,2}-\d{1,2}\s\d{1,2}:\d{1,2}$';
    String pattern3 = r'^\d{4}-\d{1,2}-\d{1,2}$';

    RegExp regExp1 = RegExp(pattern1);
    RegExp regExp2 = RegExp(pattern2);
    RegExp regExp3 = RegExp(pattern3);

    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      label = convertAndCapitalize(label ?? "");
      if (input == null) {
        return "${label.tr} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${label.tr} ${"cannot_be_empty".tr}";
      } else if (!regExp1.hasMatch(input) &&
          !regExp2.hasMatch(input) &&
          !regExp3.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${label.tr.toLowerCase()} date";
      } else {
        return null;
      }
    }
  }
}

class ValidatorNewTransaction {
  static String? email(String? input, {bool isRequired = true}) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "please_enter_your_email".tr;
      } else if (input.isEmpty) {
        return "please_enter_your_email".tr;
      } else if (!regExp.hasMatch(input)) {
        return "please_enter_your_email".tr;
      } else {
        return null;
      }
    }
  }

  static String? notes(String? input, {bool isRequired = false}) {
    String pattern = r'^.{1,1000}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"transaction".tr} ${"notes".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"transaction".tr} ${"notes".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"transaction".tr.toLowerCase()} ${"notes".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? cardHolderName(String? input, {bool isRequired = true}) {
    String pattern = r'^.{1,255}$';

    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"card".tr} ${"holder_name".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"card".tr} ${"holder_name".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"card".tr.toLowerCase()} ${"holder_name".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? cardNumber(String? input, {bool isRequired = true}) {
    String pattern = r'^[0-9]{15,19}$';

    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"card".tr} ${"number".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"card".tr} ${"number".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input.replaceAll(RegExp(r'\s+'), ''))) {
        return "${"please_enter_valid".tr} ${"card".tr.toLowerCase()} ${"number".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? ccv(String? input, {bool isRequired = true}) {
    String pattern = r'^[0-9]{3,4}$';

    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"CCV".tr} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"CCV".tr} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"ccv".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? campaign(String? input, {bool isRequired = false}) {
    String pattern = r'^.{1,1000}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"transaction".tr} ${"notes".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"transaction".tr} ${"notes".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"transaction".tr.toLowerCase()} ${"notes".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? frequency(String? input, {bool isRequired = false}) {
    String pattern = r'^.{1,1000}$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"transaction".tr} ${"notes".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"transaction".tr} ${"notes".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"transaction".tr.toLowerCase()} ${"notes".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? noOfRecurring(String? input, {bool isRequired = true}) {
    String pattern = r'\b([2-9]|[1-9]\d)\b';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"Minimum recurrings".tr} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"Minimum recurrings".tr} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(num.tryParse(input).toString())) {
        return "${"Minimum recurrings must be greater than 2".tr} ${"".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }

  static String? amount(String? input, {bool isRequired = true}) {
    String pattern = r'^\d*\.?\d+$';
    RegExp regExp = RegExp(pattern);
    if (input != null && isRequired == false && input.isNotEmpty) {
      isRequired = true;
    }

    if (!isRequired) {
      return null;
    } else {
      if (input == null) {
        return "${"transaction".tr} ${"amount".tr.toLowerCase()} ${"cannot_be_null".tr}";
      } else if (input.isEmpty) {
        return "${"transaction".tr} ${"amount".tr.toLowerCase()} ${"cannot_be_empty".tr}";
      } else if (!regExp.hasMatch(input)) {
        return "${"please_enter_valid".tr} ${"transaction".tr.toLowerCase()} ${"amount".tr.toLowerCase()}";
      } else {
        return null;
      }
    }
  }
}
