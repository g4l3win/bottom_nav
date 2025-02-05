import 'package:flutter/material.dart';

class EmoticonFace extends StatelessWidget {
  final String emoticonFace;
  const EmoticonFace({Key? key,
    required this.emoticonFace
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //yang dipindahin kayaknya mulai container dan padding
    return Container(
      //dekorasi
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(12), //sudut melengkung
      ),
      //pading
      padding: EdgeInsets.all(15),
      //icon emoticon
      child: Center(//biar ditengah
        child: Text(emoticonFace,
        style: TextStyle(fontSize: 28),),
      ),
    );
  }
}
