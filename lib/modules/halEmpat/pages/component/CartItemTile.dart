import 'package:flutter/material.dart';
import 'package:bottom_nav/modules/halEmpat/controller/halEmpat_controller.dart';
import 'package:get/get.dart';

class CartItemTile extends GetView<HalempatController> {
  final HalempatController controller;
  final int index;

  const CartItemTile({Key? key, required this.controller, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = controller.cartItems[index]; // Ambil item berdasarkan index
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(8), // Sudut melengkung
          ),
          child: ListTile(
            leading: Image.asset(item.imagepath ?? 'images/settings.jpg'),
            title: Text(item.nama ?? "kosong"),
            subtitle: Text("Rp ${item.harga ?? 0}"),
            trailing: InkWell(
              child: Icon(Icons.delete),
              onTap: () {
                controller.removeItemCart(index); // Hapus item
              },
            ),
          ),
        ),

        SizedBox(height: 10), // Menambahkan jarak antar item
      ],
    );
  }
}
