// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    json['token'] as String,
    json['lastLogin'] as String,
    json['local'] as String,
    json['theme'] as int,
    json['cacheConfig'] == null
        ? null
        : CacheConfig.fromJson(json['cacheConfig'] as Map<String, dynamic>),
  )
    ..ad = json['ad'] == null
        ? null
        : AdModel.fromJson(json['ad'] as Map<String, dynamic>)
    ..userLogin = json['userLogin'] == null
        ? null
        : UserModel.fromJson(json['userLogin'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'ad': instance.ad,
      'userLogin': instance.userLogin,
      'token': instance.token,
      'lastLogin': instance.lastLogin,
      'local': instance.local,
      'theme': instance.theme,
      'cacheConfig': instance.cacheConfig,
    };
