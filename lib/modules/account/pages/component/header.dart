import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.blue, width: 1.0),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Account",
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Regular account",
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        //container yang ada identitas profilnya
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blue, width: 1.0),
            //bayangan disini
            boxShadow: [
              BoxShadow(
                blurRadius: 1.0,
                offset: Offset(
                    0, 5), // Geser shadow ke bawah (X = 0, Y = 5)
                spreadRadius: 0, // Mengontrol sebaran shadow
                color: Colors.blue,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Nama : John Doe",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("Laki-laki | 30 Tahun"),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Tinggi",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "170cm",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Berat",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "70 kg",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Aktif",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Email: asbdgs@email.com"),
                      Text("Handphone: 0834235236"),
                    ],
                  ),
                  Icon(Icons.check)
                ],
              )
            ],
          ),
        ),
      ]
    );

  }
}
