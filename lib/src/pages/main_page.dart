import 'dart:convert';

import 'package:consultagov/src/controllers/MainController.dart';
import 'package:consultagov/src/models/Endereco.dart';
import 'package:consultagov/src/pages/endereco_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String cep = "";

  //Endereco result = new Endereco(Cep: Cep, Rua: Rua, Cidade: Cidade);
  _success() {}

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: MainController.instance,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Center(
                child: Text(
                  'Consulta CEP',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Consultar CEP',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) {
                      cep = value;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'CEP', border: OutlineInputBorder()),
                  ),
                  Container(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EnderecoPage(CEP: cep)))
                    },
                    child: Text('Consultar'),
                    style: ElevatedButton.styleFrom(fixedSize: Size(200, 50)),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
