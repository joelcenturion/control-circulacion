import 'package:app/pages/camera.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/person.dart';
import 'package:app/pages/loading.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:camera/camera.dart';
// import 'package:app/pages/folder.dart';

Future<void> main() async {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/person': (context) => Person(),
      '/loading': (context) => Loading(),
      '/camera': (context) => Camera(),
    },
  ));
}

//Mi appBar personalizado
Widget myAppBar() {
  return MyAppBar();
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Autorización',
            style: GoogleFonts.firaSans(fontSize: 18, letterSpacing: 2.0),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/escudo.jpg',
              height: 45,
              width: 45,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.indigo[800],
    );
  }
}
