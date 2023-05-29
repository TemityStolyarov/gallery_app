class ImageModel {
  final int id;
  final String name;
  final String dateCreate;
  final String description;
  final bool isNew;
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

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      name: json['name'],
      dateCreate: json['dateCreate'],
      description: json['description'],
      isNew: json['new'],
      isPopular: json['popular'],
      image: ImageInfoModel.fromJson(json['image']),
      user: json['user'],
    );
  }
}

class ImageInfoModel {
  final int id;
  final String name;

  ImageInfoModel({
    required this.id,
    required this.name,
  });

  factory ImageInfoModel.fromJson(Map<String, dynamic> json) {
    return ImageInfoModel(
      id: json['id'],
      name: json['name'],
    );
  }
}