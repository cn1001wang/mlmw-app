class AbpUserLocalizationConfigDto {
  AbpUserCurrentCultureConfigDto currentCulture;
  List<LanguageInfo> languages;
  LanguageInfo currentLanguage;
  List<AbpLocalizationSourceDto> sources;
  Map<String, Map<String, String>> values;

  AbpUserLocalizationConfigDto.fromJson(Map json)
      : currentCulture = json['currentCulture'],
        languages = json['languages'],
        currentLanguage = json['currentLanguage'],
        sources = json['sources'],
        values = json['values'];
}

class AbpUserCurrentCultureConfigDto {
  String name;
  String displayName;
  AbpUserCurrentCultureConfigDto.fromJson(Map json)
      : name = json['name'],
        displayName = json['displayName'];
}

class AbpLocalizationSourceDto {
  String name;
  String type;
  AbpLocalizationSourceDto.fromJson(Map json)
      : name = json['name'],
        type = json['type'];
}

class LanguageInfo {
  String name;
  String displayName;
  String icon;
  bool isDefault;
  bool isDisabled;
  bool isRightToLeft;
  LanguageInfo.fromJson(Map json)
      : name = json['name'],
        displayName = json['displayName'],
        icon = json['icon'],
        isDefault = json['isDefault'],
        isDisabled = json['isDisabled'],
        isRightToLeft = json['isRightToLeft'];
}
