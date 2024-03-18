import '/core/app_export.dart';

class IconsApis extends Client {
  IconsApis();

  Future<IconsReadRes> read({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.get(
        '/api/admin/v1/icon',
        options: Options(headers: headers),
        queryParameters: requestData,
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return IconsReadRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? IconsReadRes.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } on DioException catch (e) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      throw dioException(e);
    } catch (error, stackTrace) {
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
