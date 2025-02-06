import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/browse/controller/browse_controller.dart';
import 'package:bottom_nav/modules/util/ListDataTile.dart';

class Body extends StatelessWidget {
  final BrowseController controller = Get.put(BrowseController());
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.all(18),
            color: Colors.blue,
            child: Column(children: [
              // Exercise row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bagian list',
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
              Expanded(//pakai list view builder makanya pakai expanded karena enggak tahu panjangnya akan berakhir dimana
                //JANGAN LUPA KALAU
                child: Obx(() => ListView.builder(
                    itemCount: controller.listDataAPI.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = controller.listDataAPI[index];
                      return ListDataTile(
                        materialname: item.materialname ?? "-",
                        shiftcode: item.shiftcode ?? "-",
                      );
                    })),
              ),
            ])));
  }
}
