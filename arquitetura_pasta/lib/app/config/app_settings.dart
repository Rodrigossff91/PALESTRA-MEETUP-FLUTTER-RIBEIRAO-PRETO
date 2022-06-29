import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

class AppSettings extends GetxService {
  Map<String, dynamic>? _settings;

  String get apiBase => getString("apiBase");
  String get version => getString("version");
  String get appName => getString("appName");

  String getString(String property) {
    return _settings![property].toString();
  }

  double getDouble(String property) {
    return _settings![property] as double;
  }

  bool getBoolean(String property) {
    return _settings![property] as bool;
  }

  void init() async {
    const env = String.fromEnvironment('ENV', defaultValue: 'dev');
    log(env);
    final contents = await rootBundle.loadString(
      'assets/config/settings-${env.trim()}.json',
    );

    final json = jsonDecode(contents);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    json["appName"] = packageInfo.appName;
    json["packageName"] = packageInfo.packageName;
    json["version"] = packageInfo.version;
    json["buildNumber"] = packageInfo.buildNumber;

    _settings = json;
  }
}
