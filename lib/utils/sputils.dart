import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_util/sp_util.dart';

class SPUtils {
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  SPUtils._internal();

  // static SharedPreferences _spf;

  // static Future<SharedPreferences> init() async {
  //   if (_spf == null) {
  //     _spf = await SharedPreferences.getInstance();
  //   }
  //   return _spf;
  // }

  ///主题
  static Future<bool> saveThemeIndex(int value) {
    return SpUtil.putInt('key_theme_color', value);
  }

  static int getThemeIndex() {
    if (SpUtil.containsKey('key_theme_color')) {
      return SpUtil.getInt('key_theme_color');
    }
    return 0;
  }

  ///语言
  static Future<bool> saveLocale(String locale) {
    return SpUtil.putString('key_locale', locale);
  }

  static String getLocale() {
    return SpUtil.getString('key_locale');
  }

  ///昵称
  static Future<bool> saveNickName(String nickName) {
    return SpUtil.putString('key_nickname', nickName);
  }

  static String getNickName() {
    return SpUtil.getString('key_nickname');
  }

  ///containsKey
  static String keyUserId = "key_user_id";
  static Future<bool> saveUserId(int userId) {
    return SpUtil.putInt(keyUserId, userId);
  }

  static int getUserId() {
    return SpUtil.getInt(keyUserId);
  }

  ///是否同意隐私协议
  static Future<bool> saveIsAgreePrivacy(bool isAgree) {
    return SpUtil.putBool('key_agree_privacy', isAgree);
  }

  static bool isAgreePrivacy() {
    if (!SpUtil.containsKey('key_agree_privacy')) {
      return false;
    }
    return SpUtil.getBool('key_agree_privacy');
  }

  ///是否已登陆
  static bool isLogined() {
    String nickName = getNickName();
    return nickName != null && nickName.isNotEmpty;
  }
}
