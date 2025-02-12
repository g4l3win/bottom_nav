import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/browse/controller/browse_controller.dart';
import 'package:bottom_nav/modules/util/ListDataTile.dart';

class Body extends GetView<BrowseController> {

 // Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Container(
            padding: EdgeInsets.all(18),
            color: Colors.blue,
            child: Column(children: [
              // Exercise row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bagian list hehehe',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Icon(Icons.more_horiz),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              //pakai list view builder makanya pakai expanded karena enggak tahu panjangnya akan berakhir dimana
              //JANGAN LUPA KALAU
              Container(
                height: 400,
                child: Obx(() {
                  if (controller.filteredDataAPI.isEmpty) {
                    return Center(child: CircularProgressIndicator()); // Menunggu data dari API
                  }

                  return ListView.builder(
                      itemCount: controller.filteredDataAPI.length,
                      //physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var item = controller.filteredDataAPI[index];
                        return ListDataTile(
                          materialname: item.materialname ?? "-",
                          shiftcode: item.shiftcode ?? "-",
                        );
                      }
                  );
                }),
              )
            ]));
  }
}
