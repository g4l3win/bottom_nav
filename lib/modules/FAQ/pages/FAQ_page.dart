import 'package:bottom_nav/modules/FAQ/pages/component/CarouselTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/FAQ/controller/FAQ_controller.dart';
import 'package:bottom_nav/modules/FAQ/pages/component/Header.dart';
import 'package:bottom_nav/modules/FAQ/pages/component/Body.dart';

class FAQPage extends GetView<FAQController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              //container carousel
              Header(),

              SizedBox(
                height: 30,
              ),
              //container expansion tile
              Body()
              // Container(
              //   height:
              //       400, //jangan lupa kalau mau pakai container buat listview harus dikasih batas heightnya kalau enggak dia error
              //   decoration: BoxDecoration(
              //       color: Colors.blue, // Warna background ExpansionTile,
              //       borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(20),
              //         topRight: Radius.circular(20),
              //       )),
              //   padding: EdgeInsets.only(top: 20),
              //   // Gunakan Obx agar UI terupdate saat data berubah
              //   child: Obx(() {
              //     if (controller.isLoading.value) {
              //       return Center(child: CircularProgressIndicator());
              //     }
              //
              //     return ListView.builder(
              //       itemCount: controller.QuestionsData.length,
              //       itemBuilder: (context, index) {
              //         var question = controller.QuestionsData[index]
              //             .question; // dapat data question dari controller yang udah ada list obs question
              //         var answer = controller.QuestionsData[index]
              //             .answer; //  dapat data answer dari controller yang udah ada list obs question
              //         return ExpansionTile(
              //           title: Text(question ?? "No Question"),
              //           backgroundColor:
              //               Colors.yellow[800], // Warna saat diperluas
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Text(answer ?? "No Answer"),
              //             ),
              //           ],
              //         );
              //       },
              //     );
              //   }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
