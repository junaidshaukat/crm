import 'package:flutter/material.dart';
import '/core/app_export.dart';

const String dateTimeFormatPattern = 'yyyy/MM/dd';

extension DateTimeExtension on DateTime {
  String format([
    String pattern = dateTimeFormatPattern,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  String get formatDDMMYYYY {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year.toString()}';
  }

  String get formatMMDDYYYY {
    return '${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}/${year.toString()}';
  }

  String get formatYYYYMMDD {
    return '$year/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}';
  }

  String get formatDDMMMYYYY {
    final monthAbbreviation = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${day.toString().padLeft(2, '0')}-${monthAbbreviation[month - 1]}-$year';
  }

  String get formatMMMDDYYYY {
    final monthAbbreviation = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${monthAbbreviation[month - 1]} ${day.toString()}, $year';
  }

  String get formatYYYYMMDDISO {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  String get formatDDMMYY {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year.toString().substring(2)}';
  }

  String get formatMMDDYY {
    return '${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}/${year.toString().substring(2)}';
  }

  String get formatDayOfWeekDDMMYYYY {
    final dayOfWeekNames = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return '${dayOfWeekNames[weekday - 1]}, $formatDDMMYYYY';
  }

  String get formatUnixTimestamp {
    return '${millisecondsSinceEpoch ~/ 1000}';
  }

  List<String> yearList({
    int numberOfYears = 5,
    bool reverse = true,
    bool ascendingOrder = false,
  }) {
    final int currentYear = DateTime.now().year;
    if (reverse) {
      List<String> years = List.generate(
        numberOfYears,
        (index) => (currentYear - index).toString(),
      );
      return ascendingOrder ? years.reversed.toList() : years;
    } else {
      List<String> years = List.generate(
        numberOfYears,
        (index) => (currentYear + index).toString(),
      );
      return ascendingOrder ? years.reversed.toList() : years;
    }
  }

  List<String> monthList({
    bool inNumber = false,
    bool selectMonth = false,
    int startYear = 1999,
    bool ascendingOrder = true,
  }) {
    List<String> monthList = [];

    if (selectMonth) {
      monthList.add("select_month".tr);
    }

    if (inNumber) {
      monthList.addAll([
        '01',
        '02',
        '03',
        '04',
        '05',
        '06',
        '07',
        '08',
        '09',
        '10',
        '11',
        '12'
      ]);
    } else {
      monthList.addAll([
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ]);
    }

    return ascendingOrder ? monthList : monthList.reversed.toList();
  }
}

extension StringExtensions on String {
  String get filename {
    int lastIndex = lastIndexOf('/');
    if (lastIndex == -1) {
      return this;
    }
    return substring(lastIndex + 1);
  }

  String get appendSecond {
    return '$this:00';
  }

  String get monthName {
    switch (this) {
      case '01':
        return 'Jan';
      case '02':
        return 'Feb';
      case '03':
        return 'Mar';
      case '04':
        return 'Apr';
      case '05':
        return 'May';
      case '06':
        return 'Jun';
      case '07':
        return 'Jul';
      case '08':
        return 'Aug';
      case '09':
        return 'Sep';
      case '10':
        return 'Oct';
      case '11':
        return 'Nov';
      case '12':
        return 'Dec';
      default:
        return '';
    }
  }

  String get monthNumber {
    switch (toLowerCase()) {
      case "jan":
        return '01';
      case "feb":
        return '02';
      case "mar":
        return '03';
      case "apr":
        return '04';
      case "may":
        return '05';
      case "jun":
        return '06';
      case "jul":
        return '07';
      case "aug":
        return '08';
      case "sep":
        return '09';
      case "oct":
        return '10';
      case "nov":
        return '11';
      case "dec":
        return '12';
      default:
        return '';
    }
  }

  get avatar {
    return split('').first.toUpperCase();
  }

  num get toNum {
    return num.tryParse(toString().replaceAll(',', '')) ?? 0;
  }

  double get toDouble {
    return double.tryParse(toString().replaceAll(',', '')) ?? 0;
  }

  int get toInt {
    return int.tryParse(toString().replaceAll(',', '')) ?? 0;
  }

  get formatHHMISS {
    return "$this 00:00:00";
  }

  String get orderBy {
    if (toLowerCase() == "ascending") {
      return 'asc';
    } else {
      return 'desc';
    }
  }

  double range(double min, double max) {
    return (double.parse(this) - min) / (max - min);
  }

  ///(part / whole) * 100;
  String percentage(String part) {
    // Calculate the collection percentage
    double result = (double.parse(part) / double.parse(this)) * 100;

    // Print the result
    return result.toStringAsFixed(2);
  }

  String get number {
    return replaceAll(',', '');
  }

  String get dateTime {
    DateTime dateTime = DateTime.parse(this);
    String formattedDate = "${dateTime.toLocal()}".split(" ")[0];

    return formattedDate;
  }

  organizationTitle(String? location) {
    if (location != null) {
      return "$this - $location";
    }
    return this;
  }
}

extension Int on int {
  String get monthName {
    switch (this) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '0';
    }
  }
}

extension Num on num {
  String percentage(num? raisedAmount) {
    if (this > 0) {
      if (raisedAmount != null) {
        double result = (raisedAmount / this) * 100;
        return result.toStringAsFixed(2);
      }
      return '0';
    } else {
      if (raisedAmount != null) {
        return '100';
      }
      return '0';
    }
  }
}

extension Times on TimeOfDay {
  get formatHHMISS {
    return "$hour:$minute:00";
  }
}

var card = {
  // card info required
  "cardHolderName": "Junaid",
  "cardNumber": "123456789123456",
  "ccv": "155",
  "expiryMonth": "01",
  "expiryYear": "24",
  "saveCard": true,
  //
  "amount": 11,
  "billingPeriod": "ONETIME",
  "campaignTag": 1088,
  "email": "shahzad.khan@mervice.com",
  "fee": 0,
  "noOfRecurring": 1,
  "source": "CARD",
  "userNotes": "jjgh",
};
