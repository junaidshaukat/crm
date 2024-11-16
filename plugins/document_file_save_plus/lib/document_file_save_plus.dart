import 'dart:typed_data';

import 'document_file_save_plus_platform_interface.dart';

class DocumentFileSavePlus {
  Future<String?> getPlatformVersion() {
    return DocumentFileSavePlusPlatform.instance.getPlatformVersion();
  }

  Future<void> saveMultipleFiles({
    List<Uint8List>? dataList,
    required List<String> fileNameList,
    required List<String> mimeTypeList,
  }) async {
    return DocumentFileSavePlusPlatform.instance.saveMultipleFiles(
      dataList: dataList,
      fileNameList: fileNameList,
      mimeTypeList: mimeTypeList,
    );
  }

  Future<void> saveFile(
    Uint8List data,
    String fileName,
    String mimeType,
  ) async {
    return DocumentFileSavePlusPlatform.instance.saveMultipleFiles(
      dataList: [data],
      fileNameList: [fileName],
      mimeTypeList: [mimeType],
    );
  }
}
