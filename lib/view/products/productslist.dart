import 'package:fire_auth_ex/view/products/operations_cloud.dart';
import 'package:flutter/material.dart';

class AppProductView extends StatefulWidget {
  const AppProductView({super.key});

  @override
  State<AppProductView> createState() => _AppProductViewState();
}

class _AppProductViewState extends State<AppProductView> {
  String? productName;
  String? productPrice;
  String? productImageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "ProductName",
                  icon: Icon(
                    Icons.assignment,
                    color: Colors.red,
                  ),
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      productName = value;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "ProductPrice",
                  icon: Icon(
                    Icons.assignment,
                    color: Colors.red,
                  ),
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      productPrice = value;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "ProductImageUrl",
                  icon: Icon(
                    Icons.assignment,
                    color: Colors.red,
                  ),
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      productImageUrl = value;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await Operations.createProduct(
                    name: productName!,
                    price: productPrice!,
                    Imageurl: productImageUrl!,
                  );
                },
                child: Text("Add Product"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
