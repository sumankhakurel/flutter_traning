import 'dart:convert';
import 'package:demo2/model/product_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<ProductModel>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> json = jsonDecode(response.body);
      final List<ProductModel> product = json
          .map(
            (items) => ProductModel.fromJson(items),
          )
          .toList();
      return product;
    } else {
      throw "Couldnot Get Data";
    }
  }

  Future<void> addData() async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {'title': 'New Post', 'body': 'This is a new post', 'userId': 1}),
    );

    if (response.statusCode == 201) {
      fetchData(); // Refresh data
    }
  }

  Future<void> deleteData(int id) async {
    await http.delete(Uri.parse('$apiUrl/$id'));

    fetchData(); // Refresh data
  }
}
