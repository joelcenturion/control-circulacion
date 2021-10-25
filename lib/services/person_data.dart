import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
// import 'dart:typed_data';

class PersonData {
  late String message;
  late String name;
  late String ci;
  late String bornDate;
  late String estadoDescripcion;
  late String vaccinated;
  late int dosage;
  late String vaccine;
  late String photoString;
  late final photoBytes;
  bool error = false; // EN CASO DE QUE HAYA ALGÚN ERROR
  //
  String? ciValue;
  late String url;

  PersonData({this.ciValue});

  Future<void> getData(BuildContext context) async {
    try {
      url =
          'https://mdi.bypar.com.py/check-data?document_number=$ciValue&api_key=7e9ef835066a907e4264caa94389a8695775bb94a8c66bf459ce423faab15c0f';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map data = convert.jsonDecode(response.body);
        print("STATUS CODE: ");
        print(response.statusCode);

        //Asignar valores obtenidos a variables
        message = data['response'][0]['message'];
        name = data['response'][0]['name'];
        ci = data['response'][0]['document_number'];
        bornDate = data['response'][0]['born_date'];
        estadoDescripcion = data['response'][0]['estado_descripcion'];
        dosage = data['response'][0]['dosage'];
        if (data['response'][0]['vaccinated'] == true) {
          vaccinated = 'Sí';
        } else {
          vaccinated = 'No';
        }
        vaccine = data['response'][0]['vaccine'];
        photoString = data['response'][0]['photo'];

        //DECODIFICAR IMAGEN
        photoBytes = convert.base64Decode(photoString);
      } else {
        //SI statuscode != 200 hay algún error
        error = true;
      }
    } catch (e) {
      //SI HAY ALGÚN ERROR
      print('ERROR');
      error = true;
    }
  }
}

class Global {
  static late String ci;
}
