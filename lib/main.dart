import 'package:app/services/person_data.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/person.dart';
import 'package:app/pages/loading.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/person': (context) => Person(),
        '/loading': (context) => Loading(),
      },
    ));

//Mi appBar personalizado
Widget myAppBar() {
  return MyAppBar();
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Autorización',
            // style: TextStyle(
            //   fontSize: 18.0,
            //   fontWeight: FontWeight.bold,
            //   letterSpacing: 2.0,
            // ),
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
