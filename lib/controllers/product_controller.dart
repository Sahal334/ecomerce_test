import 'package:ecomerce_test/utils/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final Dio _dio = Dio();
  List<Product> _products = [];
  bool _isLoading = false;
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _dio.get(ApiEndpoints.getProducts);

      if (response.statusCode == 200) {
        final data = response.data as List;
        _products = data.map((e) => Product.fromJson(e)).toList();
      } else {
        print("Error: ${response.statusMessage}");
      }
    } catch (e) {
      print("Fetch Error: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
  void addToCart(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  double get totalPrice => _items.fold(
      0, (sum, item) => sum + item.product.price * item.quantity);

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
