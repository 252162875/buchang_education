import 'package:buchang_education/common/global.dart';
import 'package:buchang_education/models/profile_model.dart';
import 'package:flutter/material.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  ProfileModel get _profileModel => Global.profile;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    Global.saveProfile();
    super.notifyListeners();
  }
}

class ThemeChangeNotifier extends ProfileChangeNotifier {
  ColorSwatch get theme =>
      Global.themes.firstWhere((e) => e.value == _profileModel.theme,
          orElse: () => Colors.blue);

  set theme(ColorSwatch colorSwatch) {
    if (colorSwatch != theme) {
      _profileModel.theme = colorSwatch[500].value;
      notifyListeners();
    }
  }
}

class LocalChangeNotifier extends ProfileChangeNotifier {
  Locale getLocal() {
    if (_profileModel.local == null || _profileModel.local.isEmpty) {
      return null;
    }
    var l = _profileModel.local.split("_");
    return Locale(l[0], l[1]);
  }
}
