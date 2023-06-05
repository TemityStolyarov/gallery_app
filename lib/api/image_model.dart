import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  final int id;
  final String name;
  final String dateCreate;
  final String description;
  @JsonKey(name: 'new')
  final bool isNew;
  @JsonKey(name: 'popular')
  final bool isPopular;
  final ImageInfoModel image;
  final String user;

  ImageModel({
    required this.id,
    required this.name,
    required this.dateCreate,
    required this.description,
    required this.isNew,
    required this.isPopular,
    required this.image,
    required this.user,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}

@JsonSerializable()
class ImageInfoModel {
  final int id;
  final String name;

  ImageInfoModel({
    required this.id,
    required this.name,
  });

  factory ImageInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ImageInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageInfoModelToJson(this);
}

// @JsonSerializable()
// class UserInfoModel {
//   final int id;
//   final String? email;
//   final bool? enabled;
//   final String? phone;
//   final String? fullName;
//   final String username;
//   final DateTime? birthday;
//   final List<String> roles;

//   UserInfoModel(
//     this.id,
//     this.email,
//     this.enabled,
//     this.phone,
//     this.fullName,
//     this.username,
//     this.birthday,
//     this.roles,
//   );

//   factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
//       _$UserInfoModelFromJson(json);
//   Map<String, dynamic> toJson() => _$ImageInfoModelToJson(this);
// }
