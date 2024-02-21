import 'package:cart_using_getx/controller/product_controller.dart';
import 'package:cart_using_getx/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final ProductController controller = Get.put(ProductController());

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.allProducts.length,
              itemBuilder: (context, index){
                Product item = controller.allProducts[index];
                if(controller.isCartScreen && item.count > 0){
                  return ListTile(
                    leading: SizedBox(
                      height: 150,
                      width: 100,
                      child: Image.asset(controller.allProducts[index].image)
                    ),
                    title: Text(controller.allProducts[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.allProducts[index].color),
                        Text(controller.allProducts[index].price)
                      ],
                    ),
                    trailing: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 15,
                      children: [
                        InkWell(
                          onTap: (){
                            controller.increCount(index);
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.add),
                          ),
                        ),
                        Obx(() => Text(controller.allProducts[index].count.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                        InkWell(
                          onTap: (){
                            controller.decreCount(index);
                          },
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.remove),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                else{
                  return Container();
                }
              }
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text("Total"),
                    Obx(() => Text(controller.price.value.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),))
                  ],
                ),
                MaterialButton(
                  onPressed: (){},
                  color: Colors.grey,
                  height: 40,
                  minWidth: 200,
                  child: const Text("CheckOut"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}