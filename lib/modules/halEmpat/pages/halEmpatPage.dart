import 'package:bottom_nav/modules/halEmpat/pages/cartPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/halEmpat/controller/halEmpat_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:bottom_nav/navigation/routes.dart';

class Halempatpage extends GetView<HalempatController> {
  const Halempatpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        "halaman 4 grid",
      ),
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Text("belajar fungsi add, remove list pakai grid",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                    color: Colors.blue),),
                  Divider(
                    color: Colors.grey,
                    thickness: 2.0,
                  ),
                  Obx((){
                    //kalau kayak gini yang di listen 1 block obs kalau yang pakai => yang dilisten cuma 1 baris statement
                    return GridView.builder(
                      //shrikwrap dan physics pencegah error
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      //grid delegate untuk mengatur jumlah kolom dan spasi antar grid
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, //ada 2 kolom
                          crossAxisSpacing: 10,// ini buat ngatur jarak antar kolom
                          mainAxisSpacing: 10 // untuk mengatur jarak antar baris
                        ),
                        //ngatur jumlah itemnya pakai controller biar jumlah item gridnya sama
                        itemCount: controller.ProductData.length,
                        //mengatur tampilan tiap item grid 1 per 1
                        itemBuilder:(context,index){
                          // return Card(
                          //   child: Column(
                          //     children: [
                          //       //HARUS DITULIS ALTERNATIF NULL karena di objek bisa null,sedangkan disini enggak boleh null
                          //       Image.asset(controller.ProductData[index].imagepath ?? 'images/settings.jpg'),
                          //       Text(controller.ProductData[index].nama ?? "tidak ada produk"),
                          //       Text("Rp . ${controller.ProductData[index].harga??0}")
                          //     ],
                          //   ),
                          // );

                          //pakai cara lebih bersih
                          final product = controller.ProductData[index];
                          return Card(
                            //tambahin color antara pakai container atau dibungkus lagi di dalam container
                            //trus dikasih boxdecoration
                            color: Colors.blue[200],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),//buat kasih padding dalam card harus kasih tambahan bungkus padding
                              child: Column(
                                children: [
                                  //HARUS DITULIS ALTERNATIF NULL karena di objek bisa null,sedangkan disini enggak boleh null
                                  Image.asset(product.imagepath ?? 'images/settings.jpg',
                                  height: 80,),
                                  Text(product.nama ?? "tidak ada produk"),
                                  Text("Rp. ${product.harga??0}"),
                                  Expanded(child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.yellow, // Mengatur warna latar belakang button
                                      ),
                                      onPressed: (){
                                        //buat nambahin produk yang dipilih ke dalam cart
                                        controller: controller.addItemToCart(index);
                                      }, child: Text("add to cart")))
                                ],
                              ),
                            ),
                          );
                        }

                        //item buildernya
                    );
                  })
                ]
            ),
            ),
            // FloatingActionButton(onPressed: (){},
            //   child: Icon(
            //     Icons.add_shopping_cart,
            //     size: 30, // Menambahkan ukuran ikon
            //   ),),
            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){
                    //Get.to(cartPage());
                    Get.toNamed(Routes.cart);
                  },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      // Menambah jarak horizontal
                      backgroundColor: Colors.yellow, // Mengatur warna latar belakang button
                    ),
                      child: Icon(
                        Icons.add_shopping_cart,
                        size: 30, // Menambahkan ukuran ikon
                      ),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
