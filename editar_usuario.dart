import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class EditarUsuario extends StatefulWidget {

  final List lista;
  int index;

  EditarUsuario({ this.lista, this.index });

  @override
  _EditarUsuarioState createState() => _EditarUsuarioState();

}

class _EditarUsuarioState extends State<EditarUsuario> {

  TextEditingController controlNombre = new TextEditingController();
  TextEditingController controlTelefono = new TextEditingController();
  TextEditingController controlEmail = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("EDITAR USUARIO"),
      ),

      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[

              new Text(
                "ID: "+widget.lista[widget.index]['idUsuario']
              ),

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
                child: Text("Editar Usuario"),
                onPressed: () {

                  editarUsuario();
                  Navigator.of(context).pop();

                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void editarUsuario() {
    var url = "http://192.168.0.11/pruebas/editarUsuario.php";
    http.post(url, body: {
      "idUsuario": widget.lista[widget.index]['idUsuario'],
      "nombre": controlNombre.text,
      "telefono": controlTelefono.text,
      "email": controlEmail.text,
    });
  }

}