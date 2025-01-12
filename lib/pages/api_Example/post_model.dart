class PostModel {
  final String? id;
  final String name;
  final String description;

  PostModel({this.id, required this.name, required this.description});

  factory PostModel.fromjson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      description: json['details'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'details': description};
  }
}
