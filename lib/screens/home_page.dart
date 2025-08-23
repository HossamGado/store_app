import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/widgets/card_widget.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, color: Colors.grey),
        title: Text("New Trend", style: TextStyle(color: Colors.black87)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 120),
          child: FutureBuilder<List<ProductModel>>(
              future: AllProductServices().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState==ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator(),);
                } else if(snapshot.hasError) {
                  return Center(child: Text("Error ${snapshot.hasError}"));
                }else if(snapshot.hasData){
                  List<ProductModel>products = snapshot.data!;
                  return GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.9,
                      crossAxisCount: 2,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return CardWidget(product:products[index],);
                    },
                  );
                }else{
                  return Center(child: Text("No Product Found"),);
                }

              }
              )
      ),
    );
  }
}
