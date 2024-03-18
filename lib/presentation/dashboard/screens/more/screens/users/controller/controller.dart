import '/core/app_export.dart';

export 'create.dart';
export 'update.dart';

class UsersController extends GetxController {
  Props props = Props();
  RxList<Users> users = RxList([]);

  @override
  void onInit() async {
    await getUsers();
    super.onInit();
  }

  Future<void> getUsers() async {
    try {
      props.useState(UseState.loading);
      UsersReadRes response = await Get.find<Api>().users.read();
      if (response.result == true) {
        users(response.data);
        props.useState(UseState.done);
      } else {
        throw response;
      }
    } on UsersReadRes catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.message));
    } on DioResponse catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.message));
    } on NoInternetException catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.toString()));
    } catch (e) {
      props.useState(UseState.error);
      props.error(UseError(message: e.toString()));
    }
  }

  bool? getStatus(Users user) {
    Organization org = user.organizations!.singleWhere((org) => org.tagNumber == user.organizationTag);
    return org.status;
  }

  Future<void> tryAgain() async {
    props.error(UseError(message: null));
    await getUsers();
  }

  Future<void> reloadData() async {
    await getUsers();
  }

  Future delete(num? tagNumber) async {
    try {
      props.useState(UseState.deleting);
      UsersDeleteRes response = await Get.find<Api>().users.delete(tagNumber: tagNumber);
      if (response.result == true) {
        Get.back();
        await getUsers();
      } else {
        throw response;
      }
    } on UsersDeleteRes catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
      Toasts.warning(message: e.message.toString());
    } on DioResponse catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.message));
      Toasts.warning(message: e.message.toString());
    } on NoInternetException catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.warning(message: e.toString());
    } catch (e) {
      props.useState(UseState.none);
      props.error(UseError(message: e.toString()));
      Toasts.error(message: e.toString());
    }
  }
}
