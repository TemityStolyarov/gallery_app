// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      id: json['id'] as int,
      name: json['name'] as String,
      dateCreate: json['dateCreate'] as String,
      description: json['description'] as String,
      isNew: json['isNew'] as bool,
      isPopular: json['isPopular'] as bool,
      image: ImageInfoModel.fromJson(json['image'] as Map<String, dynamic>),
      user: json['user'] as String,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dateCreate': instance.dateCreate,
      'description': instance.description,
      'isNew': instance.isNew,
      'isPopular': instance.isPopular,
      'image': instance.image,
      'user': instance.user,
    };

ImageInfoModel _$ImageInfoModelFromJson(Map<String, dynamic> json) =>
    ImageInfoModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ImageInfoModelToJson(ImageInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
