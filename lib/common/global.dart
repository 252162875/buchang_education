import 'dart:convert';

import 'package:buchang_education/common/net_cache.dart';
import 'package:buchang_education/models/cache_config.dart';
import 'package:buchang_education/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themes = Colors.primaries;
const _languages = {
  "中文简体": "zh_CN",
  "English": "en_US",
};

class Global {
  static SharedPreferences _preferences;
  static ProfileModel profile = ProfileModel("", "", "", 0, null);

// 网络缓存对象(拦截器)
  static NetCache netCache = NetCache();

  static List<MaterialColor> get themes => _themes;

// 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

//初始化全局信息，会在APP启动时执行
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    var _profile = _preferences.get("profile");
    if (_profile == null) {
      try {
        profile = ProfileModel.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }
    // 如果没有缓存策略，设置默认缓存策略
    profile.cacheConfig = profile.cacheConfig ?? CacheConfig(true, 3600, 100);
  }

  static saveProfile() {
    _preferences.setString("profile", jsonEncode(profile.toJson()));
  }
}
