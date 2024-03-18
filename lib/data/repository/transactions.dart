import '/core/app_export.dart';

class TransactionsApis extends Client {
  TransactionsApis();

  Future<TransactionsRes> read({
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
        '/api/admin/v1/transaction',
        options: Options(headers: headers),
        queryParameters: requestData,
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return TransactionsRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? TransactionsRes.fromJson(response.data)
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

  Future<TransactionRes> create({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.post(
        '/api/admin/v1/transaction/cardTransaction',
        options: Options(headers: headers),
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return TransactionRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? TransactionRes.fromJson(response.data)
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

  Future<SendInvoiceRes> sendInvoice({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.post(
        '/api/admin/v1/transaction/sendInvoice',
        options: Options(headers: headers),
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return SendInvoiceRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? SendInvoiceRes.fromJson(response.data)
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

  Future<UpdateEmailRes> updateEmail({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.post(
        '/api/admin/v1/transaction/updateEmail',
        options: Options(headers: headers),
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return UpdateEmailRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? UpdateEmailRes.fromJson(response.data)
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

  Future<WalletRes> wallet({
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
        '/api/admin/v1/donor/payment/wallet',
        options: Options(headers: headers),
        queryParameters: requestData,
        data: requestData,
      );
      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return WalletRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? WalletRes.fromJson(response.data)
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

  Future<TransactionExportRes> download({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool showProgressDialog = false,
    num? tagNumber,
  }) async {
    try {
      if (showProgressDialog) ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();
      Response response = await dio.get(
        '/api/admin/v1/transaction/data/export',
        options: Options(headers: headers, responseType: ResponseType.bytes),
        queryParameters: requestData,
        data: requestData,
      );

      if (showProgressDialog) ProgressDialogUtils.hideProgressDialog();
      if (isSuccessCall(response)) {
        return TransactionExportRes.fromJson(response.data, response: response);
      } else {
        throw response.data != null
            ? TransactionExportRes.fromJson(response.data, response: response)
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
