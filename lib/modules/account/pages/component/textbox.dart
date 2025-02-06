import 'package:flutter/material.dart';

class Textbox extends StatelessWidget {
  final String label;

  const Textbox({Key? key,
  required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom:10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)
      ),
      child: TextField(decoration: InputDecoration(
        labelText: label,
      ),),
    );
  }
}
