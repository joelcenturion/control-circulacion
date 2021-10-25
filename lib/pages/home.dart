import 'package:flutter/material.dart';
import 'package:app/services/person_data.dart';
import 'package:app/main.dart';
import 'dart:async';

class Home extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //controller para obtener el nro de cédula del textfiel
  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.3, -0.3),
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xff0072b0), Color(0xFF1f1d1d)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  'assets/interior_logo.jpg',
                  height: 120,
                  width: 320,
                  fit: BoxFit.fitWidth,
                ),
              ),
              ElevatedButton(
                onPressed: () => showInputDialog(context).then((ciValue) {
                  myController.text = ''; //Limpiar textfield
                  ciValue = ciValue.replaceAll(' ', ''); //Remove white spaces
                  RegExp regexp =
                      RegExp(r'^[0-9]*$'); //Para validación de sólo números
                  if (!regexp.hasMatch(ciValue)) {
                    showAlert();
                  } else if (ciValue != false && ciValue != '') {
                    Global.ci = ciValue;
                    Navigator.pushNamed(context, '/loading');
                  }
                }),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(50, 18, 50, 18),
                  child: Text(
                    'Ingresar Cédula',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff0563fa),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Future<dynamic> showInputDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ingrese Nro. de Cédula'),
            content: TextField(
              decoration: InputDecoration(
                  labelText: 'Ingrese Cédula',
                  contentPadding: EdgeInsets.only(left: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  )),
              controller: myController,
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('Cancelar')),
              TextButton(
                  onPressed: () {
                    return Navigator.pop(context, myController.text.toString());
                  },
                  child: Text('Aceptar'))
            ],
          );
        });
  }

// MOSTRAR ALERT DIALOG CUANDO SE INGRESAN MAL LOS DATOS
  showAlert() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          Timer(Duration(milliseconds: 700), () {
            Navigator.pop(context);
          });
          return AlertDialog(
            title: Center(child: Text('Ingrese sólo números')),
          );
        });
  }
}
