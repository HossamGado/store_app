import 'package:store_app/models/product_model.dart';
import '../helper/api.dart';

class AllProductServices {
  Future<List<dynamic>> getAllProducts() async {
    List<dynamic> data =await Api().get(url:"https://fakestoreapi.com/products");
      List<ProductModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(ProductModel.fromjson(data[i]));
      }
      return productsList;
    }
  }

