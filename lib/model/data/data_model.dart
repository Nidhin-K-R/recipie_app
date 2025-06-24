class DataModel {
  final String image;

  DataModel({required this.image});

  //from json

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(image: json['image'] ?? '');
  }
}
