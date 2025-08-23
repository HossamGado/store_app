import 'package:store_app/models/product_model.dart';
import '../helper/api.dart';

class AllProductServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =await Api().get(url:"https://fakestoreapi.com/products");
    print(data[0]);
      List<ProductModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(ProductModel.fromjson(data[i]));
      }
      return productsList;
    }
  }

