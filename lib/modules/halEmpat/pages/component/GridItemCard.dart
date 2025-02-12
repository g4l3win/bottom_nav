import 'package:flutter/material.dart';
import 'package:bottom_nav/modules/halEmpat/controller/halEmpat_controller.dart';
import 'package:get/get.dart';

class GridItemCard extends GetView<HalempatController> {
  final int index;
  final HalempatController controller;
  const GridItemCard({Key? key,
  required this.index, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Text("Rp. ${controller.addTitik(product.harga??0)}"),
            Expanded(child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // Mengatur warna latar belakang button
                ),
                onPressed: (){
                  //buat nambahin produk yang dipilih ke dalam cart
                  controller: controller.addItemToCart(index);
                  Get.snackbar(
                    "Sukses", // Judul snackbar
                    "Item telah ditambahkan ke cart!", // Isi pesan
                    snackPosition: SnackPosition.BOTTOM, // Posisinya di bawah
                    backgroundColor: Colors.green, // Warna background
                    colorText: Colors.white, // Warna teks
                    borderRadius: 8,
                    margin: EdgeInsets.all(10),
                    duration:
                    Duration(seconds: 2), // Snackbar muncul selama 2 detik
                    icon: Icon(Icons.check_circle,
                        color: Colors.white), // Ikon di snackbar
                  );
                }, child: Text("add to cart")))
          ],
        ),
      ),
    );;
  }
}
