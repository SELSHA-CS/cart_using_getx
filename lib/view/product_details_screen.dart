import 'package:cart_using_getx/model/product.dart';
import 'package:flutter/material.dart';


class ProductDetailsScreen extends StatelessWidget {
  final Product products;
  const ProductDetailsScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.asset(products.image),
          ),
          const SizedBox(height: 15,),
          Text(products.name),
          const SizedBox(height: 15,),
          Text(products.price),
          const SizedBox(height: 15,),
          const Text("Description"),
          const SizedBox(height: 16,),
          const Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."),
        ],
      ),
    );
  }
}