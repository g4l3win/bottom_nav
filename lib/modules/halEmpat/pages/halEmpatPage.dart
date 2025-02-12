import 'package:bottom_nav/modules/halEmpat/pages/component/GridItemCard.dart';
import 'package:bottom_nav/modules/settings/pages/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/halEmpat/controller/halEmpat_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:bottom_nav/navigation/routes.dart';

class Halempatpage extends GetView<HalempatController> {
  //const Halempatpage({Key? key}) : super(key: key);

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // InkWell(child: Icon(Icons.arrow_back_ios),
                      // onTap: (){
                      //   //Get.back();// enggak jalan karena enggak berada di dalam stack navigasi
                      //   Get.off(SettingsPage());
                      // }
                      //   ,),
                      Container(
                        width: 300,
                        child: Text("belajar fungsi add, remove list pakai grid",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                              color: Colors.blue),),
                      ),
                    ],
                  ),

                  Divider(
                    color: Colors.grey,
                    thickness: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed:() {
                        controller.sortingNama();
                      },
                          child: Text("Sort alfabet ascending"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          padding: EdgeInsets.all(10)// Mengatur warna latar belakang button
                        ),
                      ),
                      ElevatedButton(onPressed:() {
                        controller.sortingNamaDes();
                      },
                          child: Text("Sort alfabet decending"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            padding: EdgeInsets.all(10)// Mengatur warna latar belakang button
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed:() {
                        controller.sortingHargaAs();
                      },
                          child: Text("Sort harga ascending"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            padding: EdgeInsets.all(10)// Mengatur warna latar belakang button
                        ),),
                      ElevatedButton(onPressed:() {
                        controller.sortingHargaDes();
                      },
                          child: Text("Sort harga decending"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            padding: EdgeInsets.all(10)// Mengatur warna latar belakang button
                        ),),
                    ],
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
                          return GridItemCard(index: index, controller: controller);
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
