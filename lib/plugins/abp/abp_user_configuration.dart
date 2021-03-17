import 'package:mlmw_app/plugins/abp/abp_user_configuration_sub.dart';
import 'package:mlmw_app/plugins/abp/localization.dart';

class AbpUserConfiguration {
  AbpMultiTenancyConfigDto multiTenancy;
  AbpUserSessionConfigDto session;
  AbpUserLocalizationConfigDto localization;
  AbpUserFeatureConfigDto features;
  AbpUserAuthConfigDto auth;
  AbpUserNavConfigDto nav;
  AbpUserSettingConfigDto setting;
  AbpUserClockConfigDto clock;
  dynamic timing;
  dynamic security;
  Map<String, dynamic> custom;

  AbpUserConfiguration.fromJson(Map json) {
    multiTenancy = AbpMultiTenancyConfigDto.fromJson(json['multiTenancy']);
    session = AbpUserSessionConfigDto.fromJson(json['session']);
    localization = AbpUserLocalizationConfigDto.fromJson(json['features']);
    features = AbpUserFeatureConfigDto.fromJson(json['features']);
    auth = AbpUserAuthConfigDto.fromJson(json['auth']);
    nav = AbpUserNavConfigDto.fromJson(json['nav']);
    setting = AbpUserSettingConfigDto.fromJson(json['setting']);
    clock = AbpUserClockConfigDto.fromJson(json['clock']);
    timing = json['timing'];
    security = json['security'];
    custom = json['custom'];
  }
}
