import 'package:json_annotation/json_annotation.dart'; 
  
part 'user_model.g.dart';


@JsonSerializable()
  class UserModel extends Object {

  @JsonKey(name: 'imgUrl')
  String imgUrl;

  @JsonKey(name: 'linkUrl')
  String linkUrl;

  UserModel(this.imgUrl,this.linkUrl,);

  factory UserModel.fromJson(Map<String, dynamic> srcJson) => _$UserModelFromJson(srcJson);

}

  
