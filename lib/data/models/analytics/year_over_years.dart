import 'package:flutter/material.dart';
import '/core/app_export.dart';

class YearOverYearReq {
  num? numberOfYears;
  bool? groupData;
  YearOverYearReq({this.numberOfYears, this.groupData = true});

  Map<String, dynamic> toJson() {
    return {'numberOfYears': numberOfYears, 'groupData': groupData};
  }
}

class YearOverYearRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  YearOverYear? data;

  YearOverYearRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory YearOverYearRes.fromJson(
      Map<String, dynamic> json, Map<String, dynamic> requestData) {
    return YearOverYearRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null ? YearOverYear.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'messageDetails': messageDetails,
      'data': data?.toJson(),
    };
  }
}

class YearOverYear {
  String? currencySymbol;
  List<YearData>? values;
  num? total;
  num? minValue;
  num? maxValue;
  List<ChartData>? chartData;

  YearOverYear({
    this.currencySymbol,
    this.values,
    this.total,
    this.chartData = const [],
    this.minValue = 0,
    this.maxValue = 1,
  });

  factory YearOverYear.fromJson(Map<String, dynamic> json) {
    num totalAmount = 0.0;
    num minValue = double.infinity;
    num maxValue = -double.infinity;
    List<YearData> yearDataList = [];
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
      yearDataList = values.map((value) => YearData.fromJson(value)).toList();
      for (var i = 0; i < yearDataList.length; i++) {
        console.log(yearDataList[i].year);
        List<Spots>? spots = [];
        for (var y = 0; y < yearDataList[i].months!.length; y++) {
          spots.add(
            Spots(
              yearDataList[i].months![y].toDouble(),
              yearDataList[i].amounts![y].toDouble(),
            ),
          );
        }
        chart.add(
          ChartData(
            year: yearDataList[i].year,
            color: colors[i],
            spots: spots,
          ),
        );
      }

      for (var yearData in yearDataList) {
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

    return YearOverYear(
      currencySymbol: json['currencySymbol'],
      total: totalAmount,
      values: yearDataList,
      chartData: chart,
      minValue: minValue == double.infinity ? null : minValue,
      maxValue: maxValue == -double.infinity ? null : maxValue,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currencySymbol': currencySymbol,
      'total': total,
      'values': values?.map((e) => e.toJson()).toList(),
    };
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
}

class Spots {
  double x;
  double y;
  Spots(this.x, this.y);
}

class ChartData {
  num? year;
  Color? color;
  List<Spots>? spots;

  ChartData({this.color, this.spots, this.year});

  toJson() {
    return {'color': color, 'spots': spots, 'year': year};
  }
}

class YearData {
  num? year;
  List<num>? months;
  List<num>? amounts;

  YearData({
    this.year,
    this.months,
    this.amounts,
  });

  factory YearData.fromJson(Map<String, dynamic> json) {
    return YearData(
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
