import 'package:cart_using_getx/model/product.dart';
import 'package:cart_using_getx/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  RxList<Product> allProducts = productList.obs;
  bool isItemListScreen = true;
  bool isCartScreen = false;
  Rx<int> itemCount = 0.obs;
  Rx<double> price = 0.0.obs;

  Widget navigateToCartScreen(BuildContext context) {
    isCartScreen = true;
    isItemListScreen= false;
    calculatePrice();
    return CartScreen();
  }

  countItems(){
    itemCount.value = 0;
    for(var element in allProducts){
      itemCount.value += element.count;
    }
  }

  calculatePrice(){
    price.value = 0.0;
    for(var element in allProducts){
      if(element.count > 0){
        price.value = (double.parse(
          element.price.replaceAll("\$", "").trim()) * element.count
        ) + price.value;
      }
    }
  }

  void increCount(int index){
    allProducts[index].count++;
    allProducts.refresh();
    countItems();
    calculatePrice();
  }

  void decreCount(int index){
    if(allProducts[index].count > 0){
      allProducts[index].count--;
      allProducts.refresh();
      countItems();
      calculatePrice();
    }
  }

}