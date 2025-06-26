class DataModel {
  final String image;
  final String name;

  DataModel({required this.image, required this.name});

  //from json

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(image: json['image'] ?? '', name: json['name'] ?? '');
  }
}
