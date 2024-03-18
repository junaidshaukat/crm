class Casting {
  static num toNum(val) {
    if (val is num) {
      return val;
    } else if (val is int) {
      return num.tryParse(val.toString()) ?? 0;
    } else if (val is double) {
      return num.tryParse(val.toString()) ?? 0;
    } else if (val is String) {
      return num.tryParse(val) ?? 0;
    } else if (val is bool) {
      return val ? 1 : 0;
    } else {
      return 0;
    }
  }

  static double toDouble(val) {
    if (val is num) {
      return double.tryParse(val.toString()) ?? 0;
    } else if (val is int) {
      return double.tryParse(val.toString()) ?? 0;
    } else if (val is double) {
      return val;
    } else if (val is String) {
      return double.tryParse(val) ?? 0;
    } else if (val is bool) {
      return val ? 1 : 0;
    } else {
      return 0;
    }
  }

  static int toInt(val) {
    if (val is num) {
      return int.tryParse(val.toString()) ?? 0;
    } else if (val is int) {
      return val;
    } else if (val is double) {
      return int.tryParse(val.toString()) ?? 0;
    } else if (val is String) {
      return int.tryParse(val) ?? 0;
    } else if (val is bool) {
      return val ? 1 : 0;
    } else {
      return 0;
    }
  }
}
