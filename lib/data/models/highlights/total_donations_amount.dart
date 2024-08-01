import 'package:flutter/material.dart';

import '/core/app_export.dart';

class TotalDonationsAmountReq {
  String? email;
  String? numberOfYears;
  bool groupData;

  TotalDonationsAmountReq({
    this.email,
    this.numberOfYears,
    this.groupData = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'numberOfYears': numberOfYears,
      'groupData': groupData
    };
  }

  String toQueryString() {
    return toJson()
        .entries
        .where((e) => e.value != null)
        .map((e) => '${e.key}=${e.value}')
        .join('&');
  }
}

class TotalDonationsAmountRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  TotalDonationsAmount? data;

  TotalDonationsAmountRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory TotalDonationsAmountRes.fromJson(Map<String, dynamic> json) {
    return TotalDonationsAmountRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null
          ? TotalDonationsAmount.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final temp = <String, dynamic>{
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'messageDetails': messageDetails,
      'data': data?.toJson(),
    };

    return temp;
  }
}

class TotalDonationsAmount {
  num? total;
  num? minValue;
  num? maxValue;
  String? currencySymbol;
  List<ChartData>? chartData;
  List<DonationsAmount>? values;

  TotalDonationsAmount({
    this.total,
    this.values,
    this.minValue = 0,
    this.maxValue = 1,
    this.currencySymbol,
    this.chartData = const [],
  });

  factory TotalDonationsAmount.fromJson(Map<String, dynamic> json) {
    num totalAmount = 0.0;
    num minValue = double.infinity;
    num maxValue = -double.infinity;
    List<DonationsAmount> values = [];
    List<ChartData> chart = [];
    List<Color> colors = [
      Colors.green,
      Colors.yellow,
      Colors.blue,
      Colors.blueGrey,
      Colors.cyanAccent,
      Colors.deepPurple,
    ];

    if (json['values'] != null) {
      List<dynamic> values = json['values'];
      values = values.map((value) => YearData.fromJson(value)).toList();
      for (var i = 0; i < values.length; i++) {
        List<Spots>? spots = [];
        for (var y = 0; y < values[i].months!.length; y++) {
          spots.add(
            Spots(
              values[i].months![y].toDouble(),
              values[i].amounts![y].toDouble(),
            ),
          );
        }
        chart.add(
          ChartData(
            year: values[i].year,
            color: colors[i],
            spots: spots,
          ),
        );
      }

      for (var yearData in values) {
        yearData.amounts?.forEach((amount) {
          totalAmount += amount;

          if (amount < minValue) {
            minValue = amount;
          }
          if (amount > maxValue) {
            maxValue = amount;
          }
        });
      }
    }

    return TotalDonationsAmount(
      values: values,
      chartData: chart,
      total: totalAmount,
      currencySymbol: json['currencySymbol'],
      minValue: minValue == double.infinity ? null : minValue,
      maxValue: maxValue == -double.infinity ? null : maxValue,
    );
  }

  Map<String, num> findMinMaxValues() {
    num minValue = double.infinity;
    num maxValue = -double.infinity;

    values?.forEach((yearData) {
      yearData.amounts?.forEach((amount) {
        if (amount < minValue) {
          minValue = amount;
        }
        if (amount > maxValue) {
          maxValue = amount;
        }
      });
    });

    return {'minValue': minValue, 'maxValue': maxValue};
  }

  Map<String, dynamic> toJson() {
    return {
      'currencySymbol': currencySymbol,
      'values': values?.map((item) => item.toJson()).toList(),
      'minValue': minValue == double.infinity ? null : minValue,
      'maxValue': maxValue == -double.infinity ? null : maxValue,
    };
  }
}

class DonationsAmount {
  num? year;
  List<num>? months;
  List<num>? amounts;

  DonationsAmount({
    this.year,
    this.months,
    this.amounts,
  });

  factory DonationsAmount.fromJson(Map<String, dynamic> json) {
    return DonationsAmount(
      year: json['year'],
      months: json['months'] != null
          ? List<int>.from(json['months'].map((x) => x))
          : null,
      amounts: json['amounts'] != null
          ? List<double>.from(json['amounts'].map((x) => x.toDouble()))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'months': months,
      'amounts': amounts,
    };
  }
}
