import 'package:cart_using_getx/controller/product_controller.dart';
import 'package:cart_using_getx/view/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final ProductController controller = Get.put(ProductController());

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.allProducts.length,
      itemBuilder: (context, index){
        return Card(
          elevation: 2,
          child: ListTile(
            onTap: (){
              Get.to(ProductDetailsScreen(products: controller.allProducts[index]));
            },
            tileColor: Colors.grey[200],
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
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.add),
                  ),
                ),
                //IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                Obx(() => Text(controller.allProducts[index].count.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                //IconButton(onPressed: (){}, icon: Icon(Icons.remove))
                InkWell(
                  onTap: (){
                    controller.decreCount(index);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.remove),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}