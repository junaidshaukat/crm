import '/core/app_export.dart';

class TransactionsApis extends Client {
  TransactionsApis();

  Future<TransactionsRes> read({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/transaction',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return TransactionsRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? TransactionsRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<TransactionRes> create({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.post(
        '/api/admin/v1/transaction/cardTransaction',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return TransactionRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? TransactionRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<SendInvoiceRes> sendInvoice({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.post(
        '/api/admin/v1/transaction/sendInvoice',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return SendInvoiceRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? SendInvoiceRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<UpdateEmailRes> updateEmail({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.post(
        '/api/admin/v1/transaction/updateEmail',
        options: Options(headers: headers, extra: {'debug': debug}),
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return UpdateEmailRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? UpdateEmailRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<WalletRes> wallet({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = false,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/donor/payment/wallet',
        options: Options(headers: headers, extra: {'debug': debug}),
        queryParameters: requestData,
        data: requestData,
      );
      if (isSuccessCall(response, debug: debug)) {
        return WalletRes.fromJson(response.data);
      } else {
        throw response.data != null
            ? WalletRes.fromJson(response.data)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }

  Future<TransactionExportRes> download({
    Map<String, String> headers = const {
      'Content-type': 'application/json',
    },
    Map<String, dynamic> requestData = const {},
    bool debug = false,
    num? tagNumber,
  }) async {
    try {
      isNetworkConnected();

      Response response = await dio.get(
        '/api/admin/v1/transaction/data/export',
        options: Options(headers: headers, responseType: ResponseType.bytes),
        queryParameters: requestData,
        data: requestData,
      );

      if (isSuccessCall(response, debug: debug)) {
        return TransactionExportRes.fromJson(response.data, response: response);
      } else {
        throw response.data != null
            ? TransactionExportRes.fromJson(response.data, response: response)
            : 'something_went_wrong'.tr;
      }
    } on DioException catch (e) {
      throw dioException(e, debug: debug);
    } catch (error) {
      rethrow;
    }
  }
}
