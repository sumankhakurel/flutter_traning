import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;

  ProductModel({required this.name, required this.description});
}
