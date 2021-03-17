class AbpMultiTenancyConfigDto {
  bool isEnabled;
  bool ignoreFeatureCheckForHostUsers;
  dynamic sides;

  AbpMultiTenancyConfigDto(
      this.isEnabled, this.ignoreFeatureCheckForHostUsers, this.sides);

  AbpMultiTenancyConfigDto.fromJson(Map json)
      : isEnabled = json['isEnabled'],
        ignoreFeatureCheckForHostUsers = json['ignoreFeatureCheckForHostUsers'],
        sides = json['sides'];
}

class AbpUserSessionConfigDto {
  int userId;
  int tenantId;
  int impersonatorUserId;
  int impersonatorTenantId;
  MultiTenancySides multiTenancySide;

  AbpUserSessionConfigDto.fromJson(Map json)
      : userId = json['userId'],
        tenantId = json['tenantId'],
        impersonatorUserId = json['impersonatorUserId'],
        impersonatorTenantId = json['impersonatorTenantId'],
        multiTenancySide = MultiTenancySides.values[json['multiTenancySide']];
}

enum MultiTenancySides { NULL, Tenant, Host }

class AbpUserFeatureConfigDto {
  Map<String, Map<String, String>> allFeatures;
  AbpUserFeatureConfigDto.fromJson(Map json)
      : allFeatures = json['allFeatures'];
}

class AbpUserAuthConfigDto {
  Map<String, dynamic> allPermissions;
  Map<String, dynamic> grantedPermissions;

  List<String> toListLowerCase(List<String> list) {
    return list.map((e) => e.toLowerCase()).toList();
  }

  AbpUserAuthConfigDto.fromJson(Map json) {
    allPermissions = new Map<String, dynamic>.fromIterables(
      toListLowerCase(json['allPermissions'].keys.toList()),
      json['allPermissions'].values.toList(),
    );
    grantedPermissions = new Map<String, dynamic>.fromIterables(
      toListLowerCase(json['grantedPermissions'].keys.toList()),
      json['grantedPermissions'].values.toList(),
    );
  }
}

class AbpUserSettingConfigDto {
  Map<String, dynamic> values;
  AbpUserSettingConfigDto.fromJson(Map json) : values = json['values'];
}

class AbpUserClockConfigDto {
  String provider;
  AbpUserClockConfigDto.fromJson(Map json) : provider = json['provider'];
}

class AbpUserNavConfigDto {
  Map<String, UserMenu> menus;
  AbpUserNavConfigDto.fromJson(Map json) {
    var keys = json['menus'].keys.toList();
    List<UserMenu> values = json['menus']
        .values
        .toList()
        .map<UserMenu>((item) => UserMenu.fromJson(item))
        .toList();
    menus = new Map<String, UserMenu>.fromIterables(keys, values);
  }
}

class UserMenu {
  String name;
  String displayName;
  Map customData;
  dynamic items;
  UserMenu.fromJson(Map json)
      : name = json['name'],
        displayName = json['displayName'],
        customData = json['customData'],
        items = json['items'];
}
