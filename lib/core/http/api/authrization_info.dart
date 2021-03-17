import 'package:mlmw_test/plugins/abp/abp_user_configuration.dart';
import 'package:mlmw_test/plugins/dio_manager.dart';

class Abp {
  static AbpUserConfiguration _config;
  static Duration timeout = new Duration(seconds: 1);
  static DateTime lastConfigTime;
  static Future<AbpUserConfiguration> _getAbpConfig() async {
    return await DioManager()
        .dio
        .get("/UserConfiguration/GetAll")
        .then((value) {
      return _config = AbpUserConfiguration.fromJson(value.getResult());
    }).catchError((error) {
      print("ERROR: $error");
    });
  }

  Future<AbpUserConfiguration> get config async {
    if (_config == null ||
        DateTime.now().isAfter(lastConfigTime.add(timeout))) {
      lastConfigTime = DateTime.now();
      await _getAbpConfig();
    }
    print('登入信息：${_config.session.userId}');
    return _config;
  }

  Future<bool> isGranted(String permissionName) async {
    permissionName = permissionName.toLowerCase();
    var c = await config;
    return c.auth.grantedPermissions[permissionName] != null ||
        c.auth.allPermissions[permissionName] != null;
  }
}

// isGranted = function (permissionName) {
//     if (typeof permissionName == 'string') {
//         permissionName = permissionName.toLowerCase();
//         return abp.auth.grantedPermissions[permissionName] != undefined || !abp.auth.allPermissions[permissionName];
//         //return abp.auth.allPermissions[permissionName] != undefined && abp.auth.grantedPermissions[permissionName] != undefined;
//     } else {
//         return false
//     }
// }
