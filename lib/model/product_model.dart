class ProductModel {
  final int id;
  final String title;
  final String body;
  final int userid;

  ProductModel(
      {required this.id,
      required this.title,
      required this.body,
      required this.userid});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userid: json['userId'],
    );
  }

  toJson() {
    return {
      'title': title,
      'body': body,
      'userId': 1,
    };
  }
}
