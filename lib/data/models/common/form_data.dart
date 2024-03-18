import 'dart:io';
import '/core/app_export.dart';

class Formdata {
  static String filename(File file) {
    return file.absolute.path.split('/').last;
  }

  static FormData fromMap(Map<String, dynamic> requestData) {
    FormData data = FormData();

    requestData.forEach((key, value) async {
      console.log({key, value});
      if (value is File) {
        File file = value;
        data.files.add(MapEntry(
          key,
          await MultipartFile.fromFile(
            file.absolute.path,
            filename: file.absolute.path.split('/').last,
          ),
        ));
      } else {
        data.fields.add(MapEntry(key, value));
      }
    });

    return data;
  }
}
