import '/core/app_export.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
    Get.lazyPut(() => CreateUsersController());
    Get.lazyPut(() => UpdateUsersController());
  }
}
