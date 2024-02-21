import 'package:cart_using_getx/controller/product_controller.dart';
import 'package:cart_using_getx/view/product_list_view.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:badges/badges.dart';

final ProductController controller = Get.put(ProductController());

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item List"),
      ),
      body: ProductListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: controller.navigateToCartScreen,)
          );
        },
        child: Badge(
          badgeContent: Obx(() => Text(controller.itemCount.value.toString())),
          child: Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}