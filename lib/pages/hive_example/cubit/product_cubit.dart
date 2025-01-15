import 'package:bloc/bloc.dart';
import 'package:demo2/pages/hive_example/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final productBox = Hive.box<ProductModel>('products');

  void loadProduct() {
    emit(ProductLoaded(
      product: productBox.values.toList(),
      productKeys: productBox.keys.toList(),
    ));
  }

  void addProduct(ProductModel product) {
    productBox.add(product);
    emit(ProductLoaded(
      product: productBox.values.toList(),
      productKeys: productBox.keys.toList(),
    ));
  }

  void updateProduct(int key, ProductModel updatedProduct) {
    productBox.put(key, updatedProduct);
    emit(ProductLoaded(
      product: productBox.values.toList(),
      productKeys: productBox.keys.toList(),
    ));
  }

  void deleteProduct(int key) {
    productBox.delete(key);
    emit(ProductLoaded(
      product: productBox.values.toList(),
      productKeys: productBox.keys.toList(),
    ));
  }
}
