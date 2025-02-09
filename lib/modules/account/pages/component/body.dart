import 'dart:ffi';
import 'package:bottom_nav/modules/account/controller/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/account/pages/component/textbox.dart';

class Body extends GetView<AccountController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //tambah pengguna baru latihan pakai textbox
        SizedBox(
          height: 20,
        ),
        Text(
          "Tambah pengguna baru",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 20,
        ),
        //ini textboxnya
        Textbox(
          label: "Nama Pengguna",
          tekscontroller: controller.nameController,
        ),
        Textbox(
          label: "Email",
          tekscontroller: controller.emailController,
        ),
        Textbox(
          label: "Tanggal lahir",
          tekscontroller: controller.birthdateController,
        ),
        Textbox(
          label: "Handphone",
          tekscontroller: controller.phoneController,
        ),
        Textbox(
          label: "Tinggi",
          tekscontroller: controller.heightController,
        ),
        Textbox(
          label: "Berat",
          tekscontroller: controller.weightController,
        ),
        //Row untuk radio button
        Row(
          children: [
            Text(
              "Jenis Kelamin:",
              style: TextStyle(fontSize: 15),
            ),
            Expanded(
              child: Obx(() => RadioListTile<Gender>(
                    title: Text(
                      "L",
                      style: TextStyle(fontSize: 12),
                    ),
                    value: Gender.lakiLaki,
                    groupValue: controller.selectedGender.value,
                    onChanged: (value) => controller.setSelected(value!),
                  )),
            ),
            Expanded(
              child: Obx(() => RadioListTile<Gender>(
                    title: Text(
                      "P",
                      style: TextStyle(fontSize: 12),
                    ),
                    value: Gender.perempuan,
                    groupValue: controller.selectedGender.value,
                    onChanged: (value) => controller.setSelected(value!),
                  )),
            ),
          ],
        ),

        //button
        SizedBox(
          width: double.infinity, //biar selebar parent container
          child: ElevatedButton(
              onPressed: () {
                if (controller.validateFields()) {
                  // Jika validasi berhasil, tampilkan snackbar sukses
                  Get.snackbar(
                    "Sukses", // Judul snackbar
                    "User baru telah ditambahkan!", // Isi pesan
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
                } else {
                  // Jika ada field kosong, tampilkan snackbar error
                  Get.snackbar(
                    "Gagal", // Judul snackbar
                    "Isi dulu semua data!", // Isi pesan
                    snackPosition: SnackPosition.BOTTOM, // Posisinya di bawah
                    backgroundColor: Colors.red, // Warna background
                    colorText: Colors.white, // Warna teks
                    borderRadius: 8,
                    margin: EdgeInsets.all(10),
                    duration:
                        Duration(seconds: 2), // Snackbar muncul selama 2 detik
                    icon: Icon(Icons.error,
                        color: Colors.white), // Ikon di snackbar
                  );
                }
              },
              child: Text(
                "Tambah",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      5), // Menambahkan border radius untuk sudut melengkung
                  side: BorderSide(
                    color: Colors.grey, // Warna border
                    width: 1, // Ketebalan border
                  ),
                ),
                //padding dalam button
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              )),
        )
      ],
    );
  }
}
