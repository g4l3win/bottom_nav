import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/halEmpat/controller/halEmpat_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
            Expanded(
              //pakai list view builder makanya pakai expanded karena enggak tahu panjangnya akan berakhir dimana
              //JANGAN LUPA KALAU
              child: Obx(() => ListView.builder(
                    itemCount: controller.cartItems.length,
                    shrinkWrap:
                        true, //listTile hanya akan mengikuti lebarnya isi dari list tile

                    itemBuilder: (context, index) {
                      var item = controller.cartItems[index];
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[200],
                              borderRadius:
                                  BorderRadius.circular(8), // Sudut melengkung
                            ),
                            child: ListTile(
                              leading: Image.asset(
                                  item.imagepath ?? 'images/settings.jpg'),
                              title: Text(item.nama ?? "kosong"),
                              subtitle: Text("Rp ${item.harga ?? 0}"),
                              trailing:
                                  //biar icon deletenya bisa di tap
                              InkWell(child: Icon(Icons.delete),
                              onTap: (){
                                controller:controller.removeItemCart(index);
                              },),
                            ),
                          ),
                          SizedBox(height: 10), // Menambahkan jarak antar item
                        ],
                      );
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
