import 'package:flutter/material.dart';
import 'package:mlmw_app/utils/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          // width: getProportionateScreenWidth(375),
          // decoration: BoxDecoration(color: kPrimaryColor),
          child: new Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    'assets/images/logo_horizontal.png',
                    width: getProportionateScreenWidth(195),
                  ),
                  top: getProportionateScreenHeight(142),
                  left: getProportionateScreenWidth(90),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
