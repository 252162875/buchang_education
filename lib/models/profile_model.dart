import 'package:buchang_education/models/cache_config.dart';
import 'package:buchang_education/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ad_model.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends Object {
  @JsonKey(name: 'ad')
  AdModel ad;

  @JsonKey(name: 'userLogin')
  UserModel userLogin;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'lastLogin')
  String lastLogin;

  @JsonKey(name: 'local')
  String local;

  @JsonKey(name: 'theme')
  int theme;
  @JsonKey(name: 'cacheConfig')
  CacheConfig cacheConfig;

  ProfileModel(
    this.token,
    this.lastLogin,
    this.local,
    this.theme,
    this.cacheConfig,
  );

  factory ProfileModel.fromJson(Map<String, dynamic> srcJson) =>
      _$ProfileModelFromJson(srcJson);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
