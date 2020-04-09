import 'package:buchang_education/common/common.dart';
import 'package:buchang_education/common/global.dart';
import 'package:buchang_education/pages/main_route.dart';
import 'package:buchang_education/pages/splash_route.dart';
import 'package:buchang_education/states/profile_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  Global.init();
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //runApp之后设置状态栏透明,否则会被material覆盖
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: ThemeChangeNotifier()),
        ChangeNotifierProvider.value(value: LocalChangeNotifier()),
      ],
      child: Consumer2<ThemeChangeNotifier, LocalChangeNotifier>(builder:
          (BuildContext context, ThemeChangeNotifier themeChangeNotifier,
              LocalChangeNotifier localChangeNotifier, Widget child) {
        return RefreshConfiguration(
          footerTriggerDistance: 15,
          dragSpeedRatio: 0.91,
          headerBuilder: () => MaterialClassicHeader(),
          footerBuilder: () => ClassicFooter(),
          enableLoadingWhenNoData: false,
          shouldFooterFollowWhenNotFull: (state) {
            // If you want load more with noMoreData state ,may be you should return false
            return false;
          },
          autoLoad: true,
          child: MaterialApp(
            title: "BC EDUCATION",
            routes: {RouteName.routeMain: (context) => MainRoute()},
            theme: ThemeData(
                primarySwatch: themeChangeNotifier.theme,
                accentColor: themeChangeNotifier.theme[700],
                splashColor: themeChangeNotifier.theme.withAlpha(50)),
            home: SplashRoute(),
          ),
        );
      }),
    );
  }
}
