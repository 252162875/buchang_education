import 'package:json_annotation/json_annotation.dart'; 
  
part 'ad_model.g.dart';


@JsonSerializable()
  class AdModel extends Object{

  @JsonKey(name: 'imgUrl')
  String imgUrl;

  @JsonKey(name: 'linkUrl')
  String linkUrl;

  AdModel(this.imgUrl,this.linkUrl,);

  factory AdModel.fromJson(Map<String, dynamic> srcJson) => _$AdModelFromJson(srcJson);

}

  
