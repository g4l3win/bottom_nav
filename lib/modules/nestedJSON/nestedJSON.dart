import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/nestedJSON/nestedJSON_controller.dart';

class nestedJSON extends StatelessWidget {
  final nestedJSON_controller controller = Get.put(nestedJSON_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("nested JSON"),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height:MediaQuery.of(context).size.height, // Setinggi layar,
                child: Obx((){
                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: controller.dataSiswaSekolah.length,
                      itemBuilder: (context, index){
                        return Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.blue[200]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("nama sekolah : ${controller.dataSiswaSekolah[index].namaSekolah}"),
                              Text("nama kelas : ${controller.dataSiswaSekolah[index].namaKelas}"),
                              Text("guru : ${controller.dataSiswaSekolah[index].guru}"),
                              Text("siswa : ${controller.dataSiswaSekolah[index].siswa}"),
                            ],
                          ),
                        );

                      });
                })
              )
            ],
          ),
        ),
    );
  }
}
