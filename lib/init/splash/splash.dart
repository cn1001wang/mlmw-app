import 'package:flutter/material.dart';
import 'package:mlmw_app/init/splash/components/body.dart';
import 'package:mlmw_app/router/route_map.gr.dart';
import 'package:mlmw_app/router/router.dart';
import 'package:mlmw_app/utils/size_config.dart';

//类似广告启动页
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Body();
    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //   ),
    //   child: Center(
    //     child: FlutterLogo(size: 96),
    //   ),
    // );
  }

  //倒计时
  void countDown() {
    var _duration = Duration(seconds: 2);
    new Future.delayed(_duration, goHomePage);
  }

  //页面跳转
  void goHomePage() {
    XRouter.replace(Routes.mainHomePage);
  }
}
