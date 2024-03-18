import '/core/app_export.dart';

enum UserAccountType { organization, driver }

class User {
  Box box = Hive.box(HiveBox.user);

  String? id;
  String? token;
  String? accountType;

  User({
    this.id,
    this.token,
    this.accountType,
  });

  factory User.init() {
    Box box = Hive.box(HiveBox.user);

    return User(
      id: box.get('id'),
      token: box.get('token'),
      accountType: box.get('accountType'),
    );
  }

  Future logout() async {
    Box box = Hive.box(HiveBox.user);
    await box.clear();
  }

  Future putAll(Map<dynamic, dynamic> entries) async {
    Box box = Hive.box(HiveBox.user);
    await box.putAll(entries);
  }
}
