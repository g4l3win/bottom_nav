import 'package:flutter/material.dart';

class IconSetting extends StatelessWidget {
  final IconData icon;
  final String tulisan;

  const IconSetting({Key? key, required this.icon, required this.tulisan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.yellow,
          ),
          child: Icon(icon),
        ),
        Text(tulisan),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
