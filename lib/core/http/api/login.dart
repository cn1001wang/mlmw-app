import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mlmw_app/core/http/http.dart';
import 'package:mlmw_app/utils/sputils.dart';

class Login {
  final String tenancyname;
  final String username;
  final String password;

  Login(this.tenancyname, this.username, this.password);

  login() async {
    FormData data = FormData.fromMap({
      "tenancyname": tenancyname,
      "username": username,
      "password": password,
    });

    try {
      Response response = await XHttp.dio.post(
        "/api/TokenAuth/Authenticate",
        data: data,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      var res = response.getResult();

      SPUtils.saveAccessToken(res["accessToken"]);
      SPUtils.saveEncryptedAccessToken(res["encryptedAccessToken"]);
      //Save cookies
      // List<Cookie> cookies = [
      //   Cookie(_tokenCookieName, res["accessToken"]),
      //   Cookie(_encrptedAuthTokenName, res["encryptedAccessToken"])
      // ];

      // print(cookies);`
      // (await XHttp.cookieJar)
      //     .saveFromResponse(Uri.parse(NetWorkConfig.API_PREFIX), cookies);

      // List<Cookie> cookies1 = (await DioManager().cookieJar)
      //     .loadForRequest(Uri.parse(NetWorkConfig.API_PREFIX));
      // print(cookies1);
      print("走着");
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      throw e.toString();
    }
  }
}
