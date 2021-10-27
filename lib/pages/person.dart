import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/camera.dart';

class Person extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  //Obtener datos de la persona desde loading.dart
  Map person = {};

  @override
  Widget build(BuildContext context) {
    person = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.3, -0.3),
            end: Alignment.bottomRight,
            colors: <Color>[Color(0xff0072b0), Color(0xFF1f1d1d)],
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //1er. elemento de la columna principal.
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    '${person['message']}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              //2do. elemento de la columna principal. Foto de la persona.
              Container(
                height: 150,
                width: 120,
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Image.memory(
                  person['photoBytes'],
                  //EN CASO DE QUE NO SE PUEDA CARGAR LA IMAGEN
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      'assets/empty_photo.jpg',
                      height: 150,
                      width: 120,
                      fit: BoxFit.fitHeight,
                    );
                  },
                ),
              ),
              //3er. elemento de la columna principal. CI, Nombre, Fecha de nacimiento
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            'Documento: ',
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                          Text(
                            'CI ${person['ci']}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            'Nombre: ',
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '${person['name']}'.toUpperCase(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            'Fecha de Nacimiento: ',
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                          Text(
                            '${person['born_date']}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //4to. elemento de la columna principal. Datos de Vacunación
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding: EdgeInsets.fromLTRB(5, 5, 5, 2),
                decoration: BoxDecoration(
                  color: Color(0xff07330e),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            'Antecedentes: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '${person['estado_descripcion']}'.toUpperCase(),
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            'Vacunado/a: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '${person['vaccinated']}',
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            'Dosis: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '${person['dosage']}',
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            'Vacuna: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '${person['vaccine']}'.toUpperCase(),
                                style: TextStyle(color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Expanded para arrastrar botones en la parte inferior de la pantalla
              Expanded(
                child: Container(),
              ),
              //5to. elemento de la columna principal. Botones suspendidos
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.report,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(13),
                        primary: Colors.red,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/camera');
                      },
                      child: Icon(
                        Icons.account_box_rounded,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(13),
                        primary: Colors.amber.shade700,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.done_rounded,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(13),
                        primary: Colors.green,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
