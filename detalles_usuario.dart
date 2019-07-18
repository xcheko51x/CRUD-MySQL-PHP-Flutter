import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'editar_usuario.dart';

class DetallesUsuario extends StatefulWidget {

  int index;
  List lista;

  DetallesUsuario({ this.index, this.lista });

  @override
  _DetallesUsuarioState createState() => _DetallesUsuarioState();

}

class _DetallesUsuarioState extends State<DetallesUsuario> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("DETALLES DEL USUARIO"),
      ),

      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: Column(
            children: <Widget>[

              new Text(
                "Nombre: "+widget.lista[widget.index]['nombre'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              new Text(
                "ID Usuario: "+widget.lista[widget.index]['idUsuario'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),

              new Text(
                "Telefono: "+widget.lista[widget.index]['telefono'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),

              new Text(
                "Email: "+widget.lista[widget.index]['email'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),

              new RaisedButton(
                child: Text("EDITAR"),
                onPressed: () {

                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (BuildContext context) => new EditarUsuario(
                      lista: widget.lista,
                      index: widget.index,
                    ),
                    ),
                  );

                },
              ),

              new RaisedButton(
                child: Text("BORRAR"),
                onPressed: () {

                  var url = "http://192.168.0.11/pruebas/borrarUsuario.php";
                  http.post(url, body: {
                    "idUsuario": widget.lista[widget.index]['idUsuario']
                  });

                  Navigator.of(context).pop();

                },
              ),

            ],
          ),
        ),
      ),

    );
  }

}