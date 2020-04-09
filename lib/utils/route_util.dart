import 'package:buchang_education/common/common.dart';
import 'package:flutter/material.dart';

class RouteUtil {
  static void goMain(BuildContext context) {
    pushReplacementNamed(context, RouteName.routeMain);
  }

//  static void goLogin(BuildContext context) {
//    pushNamed(context, RouteName.routeLogin);
//  }

  static void pushNamed(BuildContext context, String pageName) {
    Navigator.of(context).pushNamed(pageName);
  }

  static void pushReplacementNamed(BuildContext context, String pageName) {
    Navigator.of(context).pushReplacementNamed(pageName);
  }
}
