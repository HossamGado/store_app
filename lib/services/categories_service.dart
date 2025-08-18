import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

import '../helper/api.dart';

class CategoriesService {
  Future<List<ProductModel>> getAllProducts({
    required String categoryName,
  }) async {
    List<dynamic> data= await  Api().get(url: "https://fakestoreapi.com/products/category/${categoryName}");
      List<ProductModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(ProductModel.fromjson(data[i]));
      }
      return productsList;

  }
}
