import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  static const String routeName = "Update Product";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Update Product",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: "Product Name",
                ),
                SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: "Description",
                ),
                SizedBox(height: 10),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: "Price",
                ),
                SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: "Image",
                ),
                SizedBox(height: 50),
                CustomButton(
                  onTap: ()async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print("success");
                    } catch (e) {
                      print(e);
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  textName: "Update",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async{
    await UpdateProductService().updateProduct(
      id: product.id,
      title: productName==null?product.productName:productName!,
      desc: desc==null?product.description:desc!,
      price: price==null?product.price.toString():price!,
      image: image==null?product.image:image!,
      category: product.category,
    );
  }
}
