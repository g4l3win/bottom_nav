import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/halEmpat/controller/halEmpat_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:bottom_nav/modules/halEmpat/pages/component/CartItemTile.dart';
import 'package:bottom_nav/modules/halEmpat/pages/halEmpatPage.dart';

class cartPage extends GetView<HalempatController> {
  const cartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            InkWell(child: Icon(Icons.arrow_back_ios),
            onTap: (){
              Get.back();// enggak jalan karena enggak berada di dalam stack navigasi
              //Get.off(Halempatpage());
            }
              ,),
            Expanded(
              //pakai list view builder makanya pakai expanded karena enggak tahu panjangnya akan berakhir dimana
              //JANGAN LUPA KALAU
              child: Obx(() => ListView.builder(
                    itemCount: controller.cartItems.length,
                    shrinkWrap:
                        true, //listTile hanya akan mengikuti lebarnya isi dari list tile
                    itemBuilder: (context, index) {
                      //var item = controller.cartItems[index];
                      return CartItemTile(controller: controller, index: index);
                    },
                  )),
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.yellow
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //JANGAN LUPA PAKAI OBXNYAAAA
                  Obx(() => Text("Total : Rp ${controller.calculateTotal()}")),
                  Text("Pay now")
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
