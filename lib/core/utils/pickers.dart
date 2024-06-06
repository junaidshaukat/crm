import 'dart:io';
import 'package:flutter/material.dart';
import '/core/app_export.dart';

class Pickers {
  List<String> images = ["jpg", "jpeg", "png", "bmp", "gif"];
  List<String> videos = ["mp4", "mov"];

  Future<void> getCache() async {
    Directory cache = await getTemporaryDirectory();
    List<FileSystemEntity> contents = cache.listSync(recursive: true);
    for (FileSystemEntity entity in contents) {
      console.log(entity.path, force: true);
    }
  }

  Future<bool> clearCache() async {
    try {
      await getCache();
      Directory cache = await getTemporaryDirectory();
      List<FileSystemEntity> contents = cache.listSync(recursive: true);
      for (var entity in contents) {
        if (entity is File) {
          if (await entity.exists()) {
            await entity.delete();
          }
        } else if (entity is Directory) {
          if (await entity.exists()) {
            await entity.delete(recursive: true);
          }
        }
      }
      return true;
    } catch (e) {
      return true;
    }
  }

  // Future<File?> media({required String mediaType}) async {
  //   ImagePicker picker = ImagePicker();
  //   try {
  //     await clearCache();
  //     XFile? xFile = await picker.pickMedia();
  //     if (xFile != null) {
  //       return await copy(File(xFile.path));
  //     } else {
  //       return null;
  //     }
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

  Future<File?> media({String mediaType = 'image'}) async {
    try {
      XFile? xFile;
      await clearCache();
      ImagePicker picker = ImagePicker();

      if (mediaType == 'image') {
        xFile = await picker.pickImage(source: ImageSource.gallery);
      }
      if (mediaType == 'video') {
        xFile = await picker.pickVideo(source: ImageSource.gallery);
      }

      if (xFile != null) {
        return await copy(File(xFile.path));
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<File?> copy(File file, {String mediaType = 'image'}) async {
    Directory cache = await getTemporaryDirectory();
    String ext = file.path.split('/').last.split('.').last;
    String path = '${cache.path}/${fn.randomString}.$ext';
    if (mediaType == 'video') {
      if (videos.contains(ext.toLowerCase())) {
        if (ext.toLowerCase() != 'mp4') {
          File? temp = await convert(file);
          if (temp != null) {
            ext = temp.path.split('/').last.split('.').last;
            path = '${cache.path}/${fn.randomString}.$ext';
            return await temp.copy(path);
          } else {
            return null;
          }
        } else {
          return await file.copy(path);
        }
      } else {
        return await file.copy(path);
      }
    } else {
      return await file.copy(path);
    }
  }

  Future<File?> convert(File file) async {
    try {
      MediaInfo? media = await VideoCompress.compressVideo(
        file.path,
        deleteOrigin: false,
        quality: VideoQuality.DefaultQuality,
      );
      return media?.file;
    } catch (e) {
      return null;
    }
  }

  Future<DateTime?> date(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    bool Function(DateTime)? selectableDayPredicate,
    String? helpText,
    String? cancelText,
    String? confirmText,
    Locale? locale,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    TextDirection? textDirection,
    Widget Function(BuildContext, Widget?)? builder,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    String? errorFormatText,
    String? errorInvalidText,
    String? fieldHintText,
    String? fieldLabelText,
    TextInputType? keyboardType,
    Offset? anchorPoint,
    void Function(DatePickerEntryMode)? onDatePickerModeChange,
  }) {
    return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2050),
      currentDate: currentDate,
      initialEntryMode: initialEntryMode,
      selectableDayPredicate: selectableDayPredicate,
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      locale: locale,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0XFF007C16),
              onPrimary: Color(0XFFFFFFFF),
              onSurface: Color(0XFF007C16),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0XFF007C16),
                foregroundColor: const Color(0XFFFFFFFF),
                textStyle: TextStyle(
                  fontSize: 16.fSize,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
      initialDatePickerMode: initialDatePickerMode,
      errorFormatText: errorFormatText,
      errorInvalidText: errorInvalidText,
      fieldHintText: fieldHintText,
      fieldLabelText: fieldLabelText,
      keyboardType: keyboardType,
      anchorPoint: anchorPoint,
      onDatePickerModeChange: onDatePickerModeChange,
    ).then((value) {
      return value;
    });
  }

  Future<TimeOfDay?> time(
    BuildContext context, {
    TimeOfDay? initialTime,
    Widget Function(BuildContext, Widget?)? builder,
    bool useRootNavigator = true,
    TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial,
    String? cancelText,
    String? confirmText,
    String? helpText,
    String? errorInvalidText,
    String? hourLabelText,
    String? minuteLabelText,
    RouteSettings? routeSettings,
    void Function(TimePickerEntryMode)? onEntryModeChanged,
    Offset? anchorPoint,
    Orientation? orientation,
  }) {
    return showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      initialEntryMode: initialEntryMode,
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      errorInvalidText: errorInvalidText,
      anchorPoint: anchorPoint,
      minuteLabelText: minuteLabelText,
      hourLabelText: hourLabelText,
      orientation: orientation,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0XFF007C16),
              onPrimary: Color(0XFFFFFFFF),
              onSurface: Color(0XFF007C16),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0XFF007C16),
                foregroundColor: const Color(0XFFFFFFFF),
                textStyle: TextStyle(
                  fontSize: 16.fSize,
                ),
              ),
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          ),
        );
      },
    ).then((value) {
      return value;
    });
  }
}

Pickers pickers = Pickers();
