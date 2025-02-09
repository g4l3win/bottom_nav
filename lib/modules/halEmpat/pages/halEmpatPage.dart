import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_app_android/models/ProductModel.dart';
import 'package:simple_app_android/modules/browse/pages/browse_page.dart';
import 'package:simple_app_android/modules/halEmpat/controller/halEmpat_controller.dart';
import 'package:simple_app_android/modules/settings/pages/settings_page.dart';

class Halempatpage extends GetView<HalempatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cheat sheet coba coba widget"),
      ),
      drawer: Drawer(
        // Ini bagian Drawer
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('menuju Browse'),
              onTap: () {
                // Lakukan sesuatu saat Item 1 ditekan
                Get.to(
                  BrowsePage(),
                  transition: Transition
                      .rightToLeft, // Bisa diganti dengan animasi lain seperti fade, downToUp, etc.
                );
              },
            ),
            ListTile(
              title: Text('menuju settings'),
              onTap: () {
                // Lakukan sesuatu saat Item 2 ditekan
                // Get.to(
                //   SettingsPage(),
                //   arguments: {'id': 1, 'name': 'Product 1'},
                // );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("hello"),
            Divider(
              color: Colors.grey,
              thickness: 2.0,
            ),
            //kasih pemisah komponen secara visual
            Container(
              height: 700,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Obx(() {
                //ini obx
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.ProductData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final product = controller.ProductData[index];
                    return Card(
                      child: Column(
                        children: [
                          Image.asset(
                            product.imagepath ?? 'images/settings.jpg',
                            height: 125,
                          ),
                          Text(product.nama ?? "No Name"),
                          Text("Rp. ${product.harga ?? 0}"),
                          TextButton(
                            onPressed: () {},
                            child: Text("Add to Cart"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),

            // GridView.count(
            //   shrinkWrap:
            //       true, // Agar GridView menyesuaikan dengan ukuran konten di dalamnya
            //   physics:
            //       NeverScrollableScrollPhysics(), // Membuat GridView tidak scrollable karena sudah ada scroll di SingleChildScrollView
            //   crossAxisCount: 2,
            //   children: [
            //     Container(
            //       child: Column(
            //         children: [
            //           Image(image: Productmodel.image)
            //         ],
            //       ),
            //     )
            //   ],
            // ),
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                ),
                Positioned(
                  top:
                      50, // menempatkan widget teks hello 50 piksel dari atas stack
                  left: 50, // menempatkan widget 50 piksel dari sisi kiri
                  child: Text('Hello'),
                ),
                Positioned(
                  bottom: 50, //ini juga sama tapi dari bawah 50 piksel
                  right: 50, //ini ngatur 50 piksel dari kanan
                  child: Text('Flutter'),
                ),
              ],
            ),
            AbsorbPointer(
              //mencegah widget mendapatkan pointer events seperti taps dan drag
              //temporarily disabled touch interaction
              absorbing: true,
              child: ElevatedButton(onPressed: () {}, child: Text('Button')),
            ),
            Hero(
              tag: 'hero-tag',
              child: Image(image: AssetImage('images/image1.jpg')),
            ),
            //inkwell biar bisa ditap komponen apapun
            InkWell(
              //dia bisa muncul pointer di cursornya
              onTap: () => print("Button Tapped!"),
              child: Container(color: Colors.yellow, width: 100, height: 100),
            ),
            GestureDetector(
              //ini mirip inkwell tapi enggak muncul pointer
              onTap: () => print('Tapped!'),
              child: Container(color: Colors.green, width: 100, height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
