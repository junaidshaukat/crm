import '/core/app_export.dart';

class EnvConfig {
  Box env = Hive.box(HiveBox.environment);
  String get hostname => 'https://donorapi.mervice.ca';
  String? get adminToken => env.get('adminToken');
  String? get email => env.get('email');
  String? get password => env.get('password');
  String get appName => env.get('appName', defaultValue: '');
  String get buildNumber => env.get('buildNumber', defaultValue: '');
  String get buildSignature => env.get('buildSignature', defaultValue: '');
  String get installerStore => env.get('installerStore', defaultValue: '');
  String get packageName => env.get('packageName', defaultValue: '');
  String get version => env.get('version', defaultValue: '');
  int? get organizationTag => env.get('organizationTag');
  int get gatewayNodeTag => env.get('gatewayNodeTag', defaultValue: 0);

  initHive() {
    env = Hive.box(HiveBox.environment);
  }

  Future putAll(Map<dynamic, dynamic> entries) async {
    await env.putAll(entries);
  }

  Future clear() async {
    await env.clear();
  }
}
