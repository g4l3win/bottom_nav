import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/util/emoticon_face.dart';
import 'package:bottom_nav/modules/browse/controller/browse_controller.dart';

//getView <BrowseController> itu pake punya bindingController
class Header extends GetView<BrowseController> {
 // BrowseController controller = Get.put(BrowseController());
  //TextController textController = Get.put(TextController());

  Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0), //dikasih const soalnya padding enggak perlu berubah berubah
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // ini buat ngatur jarak antar komponen row sama gedenya
            children: [
              // Kolom teks di kiri
              Container(
                padding: EdgeInsets.all(8), //kasih padding
                child: Column( //komponen tulisan menyusun kebawah
                  crossAxisAlignment: CrossAxisAlignment.start,//biar komponennya ada di awal
                  children: [
                    Text(
                      'Halaman: Browse',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      controller.dateController.getFormattedDate(),
                      style: TextStyle(
                        color: Colors.blue[200],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              // Ikon di kanan dengan border
              Container(
                padding: EdgeInsets.all(12), //padding untuk container icon
                decoration: BoxDecoration(//dekorasi kontainer
                  color: Colors.blue[600],
                  border: Border.all(
                    color: Colors.white, // Warna border
                    width: 2, // Ketebalan border
                  ),
                  borderRadius: BorderRadius.circular(12), // Sudut melengkung
                ),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // bar buat ngetik
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 8),
                // Use GetX to make the TextField reactive
                Expanded(
                  child: TextField(
                    controller: controller.txtController.textEditingController.value, //ini memanggil controllernya text melalui binding
                    decoration: InputDecoration(
                      labelText: 'Enter text',
                    ),
                  ),
                ),
              ],
            ),

          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('How Do you feel', style: TextStyle(
                fontSize: 24,
                color:Colors.black,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  EmoticonFace(emoticonFace: '☹️'),
                  SizedBox(height: 8),
                  Text('Bad', style: TextStyle(color: Colors.black)),
                ],
              ),
              Column(
                children: [
                  EmoticonFace(emoticonFace: '😑'),
                  SizedBox(height: 8),
                  Text('Neutral',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
              Column(
                children: [
                  EmoticonFace(emoticonFace: '🙂'),
                  SizedBox(height: 8),
                  Text('Fine', style: TextStyle(color: Colors.black)),
                ],
              ),
              Column(
                children: [
                  EmoticonFace(emoticonFace: '😀'),
                  SizedBox(height: 8),
                  Text('Great', style: TextStyle(color: Colors.black)),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

