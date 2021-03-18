import 'package:auto_route/auto_route.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mlmw_app/core/http/http.dart';
import 'package:mlmw_app/core/utils/toast.dart';
import 'package:mlmw_app/generated/i18n.dart';
import 'package:mlmw_app/router/route_map.dart';
import 'package:mlmw_app/router/route_map.gr.dart';
import 'package:mlmw_app/router/router.dart';
import 'package:mlmw_app/utils/device_utils.dart';
import 'package:mlmw_app/utils/provider.dart';
import 'package:mlmw_app/utils/sputils.dart';
import 'package:provider/provider.dart';

//默认App的启动
class DefaultApp {
  //运行app
  static void run() {
    WidgetsFlutterBinding.ensureInitialized();
    SpUtil.getInstance()
        .then((value) => runApp(Store.init(ToastUtils.init(MyApp()))));
    // SPUtils.init()
    //     .then((value) => );
    initApp();
  }

  //程序初始化操作
  static void initApp() {
    XHttp.init();
    XRouter.init();

    // 透明状态栏
    if (Device.isAndroid) {
      const SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer2<AppTheme, LocaleModel>(
      builder: (context, appTheme, localeModel, _) {
        return MaterialApp(
          title: '模来模往',
          theme: ThemeData(
            primarySwatch: appTheme.themeColor,
            buttonColor: appTheme.themeColor,
          ),
          builder: ExtendedNavigator<RouterMap>(
            router: RouterMap(),
            guards: [AuthGuard()],
          ),
          locale: localeModel.getLocale(),
          supportedLocales: I18n.delegate.supportedLocales,
          localizationsDelegates: [
            I18n.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback:
              (Locale _locale, Iterable<Locale> supportedLocales) {
            if (localeModel.getLocale() != null) {
              //如果已经选定语言，则不跟随系统
              return localeModel.getLocale();
            } else {
              //跟随系统
              if (I18n.delegate.isSupported(_locale)) {
                return _locale;
              }
              return supportedLocales.first;
            }
          },
        );
      },
    );
  }
}
