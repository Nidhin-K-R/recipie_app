class DataModel {
  final String image;
  final String name;
  final double rating;
  final int prepTimeMinutes;

  DataModel({
    required this.image,
    required this.name,
    required this.rating,
    required this.prepTimeMinutes,
  });

  //from json

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      rating: json['rating'].toDouble(),
      prepTimeMinutes: json['prepTimeMinutes'],
    );
  }
}
