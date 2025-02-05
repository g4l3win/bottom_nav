import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav/modules/browse/controller/browse_controller.dart';
import 'package:bottom_nav/modules/browse/pages/components/header.dart';
import 'package:bottom_nav/modules/browse/pages/components/body.dart';

class BrowsePage extends GetView<BrowseController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Browse')),
      body: SafeArea(
        child: Column(
          // Kolom besar
          children: [
            //panggil header
            Header(),
            //bagian list panggil body
            Body(),

          ],
        ),
      ),
    );
  }
}