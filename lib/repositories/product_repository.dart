import 'package:test_project/data_model/product_response.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ProductRepository {

  Future<List<Products>> getProducts() async {
    final response = await rootBundle.loadString(
        'assets/jsonFile/products.json');
    print(productsFromJson(response));
    return productsFromJson(response.replaceAll("<p>", "").replaceAll('p>', '').replaceAll('<', ''));
  }

}
