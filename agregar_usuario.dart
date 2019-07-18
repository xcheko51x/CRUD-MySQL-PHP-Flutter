import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AgregarUsuario extends StatefulWidget {
  @override
  _AgregarUsuarioState createState() => _AgregarUsuarioState();
}

class _AgregarUsuarioState extends State<AgregarUsuario> {

  TextEditingController controlNombre = new TextEditingController();
  TextEditingController controlTelefono = new TextEditingController();
  TextEditingController controlEmail = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("AGREGAR USUARIO"),
      ),

      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[

              new TextField(
                controller: controlNombre,
                decoration: new InputDecoration(
                  labelText: "Nombre"
                ),
              ),

              new TextField(
                controller: controlTelefono,
                decoration: new InputDecoration(
                    labelText: "Telefono"
                ),
              ),

              new TextField(
                controller: controlEmail,
                decoration: new InputDecoration(
                    labelText: "Email"
                ),
              ),

              new RaisedButton(
                child: new Text("Agregar Usuario"),
                onPressed: () {

                  agregarUsuario();
                  Navigator.of(context).pop();

                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void agregarUsuario() {
    var url = "http://192.168.0.11/pruebas/agregarUsuario.php";
    http.post(url, body: {
      "nombre": controlNombre.text,
      "telefono": controlTelefono.text,
      "email": controlEmail.text,
    });
  }

}