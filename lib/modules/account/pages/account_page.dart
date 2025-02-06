import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'component/header.dart';
import 'component/body.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Account')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Header(),
                //kubu body
                Body()

              ],
            ),
          ),
        ));
  }
}
