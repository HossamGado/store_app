import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class CardWidget extends StatelessWidget {
   CardWidget({super.key, required this.product});
   ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, UpdateProductPage.routeName,arguments: product);
          },
          child: Stack(
            clipBehavior:Clip.none,
            children: [
              Container(
                height: 130,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 40,
                      offset: Offset(10, 10),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.productName.substring(0,6)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${product.price.toString()}"r" $"),
                            Icon(Icons.favorite, color: Colors.red),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 70,
                right: 40,
                child: Image.network(product.image, height: 100,width: 100,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
