import 'package:flutter/material.dart';


class ListDataTile extends StatelessWidget {
  final String materialname;
  final String shiftcode;

  const ListDataTile({
    Key? key,
    required this.materialname,
    required this.shiftcode,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.redAccent, // Warna latar belakang untuk ikon
              borderRadius: BorderRadius.circular(8), // Sudut melengkung
            ),
            padding: EdgeInsets.all(12), // Jarak di dalam kontainer
            child: Icon(
              Icons.favorite,
              color: Colors.white, // Warna ikon favorit
            ),
          ),
          title: Column(

            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                materialname,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                shiftcode,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
