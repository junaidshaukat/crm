import 'dart:io';
import 'package:flutter/material.dart';
import '/core/app_export.dart';

class Pickers {
  List<String> allowed = ["jpg", "jpeg", "png", "bmp", "gif", "mp4"];

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

  Future<File?> media() async {
    ImagePicker picker = ImagePicker();
    try {
      if (await clearCache()) {
        XFile? file = await picker.pickMedia();
        if (file != null) {
          return File(file.path);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }

  String extn(String path) {
    return path.split('/').last.split('.').last;
  }

  Future<File?> image({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool requestFullMetadata = true,
    ImageSource source = ImageSource.gallery,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    ImagePicker picker = ImagePicker();
    try {
      if (await clearCache()) {
        Directory cache = await getTemporaryDirectory();
        XFile? xFile = await picker.pickImage(
          source: source,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: imageQuality,
          requestFullMetadata: requestFullMetadata,
          preferredCameraDevice: preferredCameraDevice,
        );
        if (xFile != null) {
          File temp = File(xFile.path);
          String ext = extn(xFile.path);
          String path = '${cache.path}/${fn.randomString}.$ext';
          File file = await temp.copy(path);
          return file;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<File?> video({
    Duration? maxDuration,
    ImageSource source = ImageSource.gallery,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    ImagePicker picker = ImagePicker();
    try {
      if (await clearCache()) {
        Directory cache = await getTemporaryDirectory();
        XFile? xFile = await picker.pickVideo(
          source: source,
          maxDuration: maxDuration,
          preferredCameraDevice: preferredCameraDevice,
        );
        if (xFile != null) {
          File temp = File(xFile.path);
          String ext = extn(xFile.path);
          String path = '${cache.path}/${fn.randomString}.$ext';
          File file = await temp.copy(path);
          return file;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<File?> multiMedia({
    bool video = false,
    bool gallery = true,
  }) {
    ImagePicker picker = ImagePicker();
    ImageSource source = gallery ? ImageSource.gallery : ImageSource.camera;

    if (video) {
      return picker.pickVideo(source: source).then((file) {
        return file != null ? File(file.path) : null;
      });
    } else {
      return picker.pickImage(source: source).then((file) {
        return file != null ? File(file.path) : null;
      });
    }
  }

  Future<FilePickerResult?> file({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.custom,
    List<String>? allowedExtensions,
    dynamic Function(FilePickerStatus)? onFileLoading,
    bool allowCompression = true,
    int compressionQuality = 30,
    bool allowMultiple = false,
    bool withData = false,
    bool withReadStream = false,
    bool lockParentWindow = false,
    bool readSequential = false,
  }) async {
    FilePicker picker = FilePicker.platform;
    return picker
        .pickFiles(
      type: type,
      allowedExtensions: allowedExtensions ?? allowed,
    )
        .then((file) {
      if (file != null) {
        return file;
      } else {
        return null;
      }
    }, onError: (error) {
      throw error;
    });
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
