import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Colors.blue,
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () async {
            http.Response response = await http.post(
              Uri.parse("https://fakestoreapi.com/products"),
              body: {
                "title": "test",
                "price": "13.5",
                "description": "lorem ipsum set",
                "image": "https://i.pravatar.cc",
                "category": "electronic",
              },
              headers: {
                "accept":"application/json",
                "Content-Type":"application/x-www-form-urlencoded",
                "Authorization": "Bearer "
              }
            );
            print(response.body);
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("KAKA", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
