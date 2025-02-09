import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class Halempatpage extends StatelessWidget {
  const Halempatpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cheat sheet coba coba widget"),
      ),
      drawer: Drawer(
        // Ini bagian Drawer
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Lakukan sesuatu saat Item 1 ditekan
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Lakukan sesuatu saat Item 2 ditekan
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("hello"),
            Divider(
              color: Colors.grey,
              thickness: 2.0,
            ), //kasih pemisah komponen secara visual

            GridView.count(
              shrinkWrap:
                  true, // Agar GridView menyesuaikan dengan ukuran konten di dalamnya
              physics:
                  NeverScrollableScrollPhysics(), // Membuat GridView tidak scrollable karena sudah ada scroll di SingleChildScrollView
              crossAxisCount: 2,
              children: [
                Icon(Icons.star),
                Icon(Icons.favorite),
                Image(image: AssetImage('images/image1.jpg')),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                ),
                Positioned(
                  top:
                      50, // menempatkan widget teks hello 50 piksel dari atas stack
                  left: 50, // menempatkan widget 50 piksel dari sisi kiri
                  child: Text('Hello'),
                ),
                Positioned(
                  bottom: 50, //ini juga sama tapi dari bawah 50 piksel
                  right: 50, //ini ngatur 50 piksel dari kanan
                  child: Text('Flutter'),
                ),
              ],
            ),
            AbsorbPointer(
              //mencegah widget mendapatkan pointer events seperti taps dan drag
              //temporarily disabled touch interaction
              absorbing: true,
              child: ElevatedButton(onPressed: () {}, child: Text('Button')),
            ),
            Hero(
              tag: 'hero-tag',
              child: Image(image: AssetImage('images/image1.jpg')),
            ),
            //inkwell biar bisa ditap komponen apapun
            InkWell(
              //dia bisa muncul pointer di cursornya
              onTap: () => print("Button Tapped!"),
              child: Container(color: Colors.yellow, width: 100, height: 100),
            ),
            GestureDetector(
              //ini mirip inkwell tapi enggak muncul pointer
              onTap: () => print('Tapped!'),
              child: Container(color: Colors.green, width: 100, height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
