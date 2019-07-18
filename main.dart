import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'agregar_usuario.dart';
import 'detalles_usuario.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ListaUsuarios(),
    );
  }
}

class ListaUsuarios extends StatefulWidget {
  @override
  _ListaUsuariosState createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  
  Future<List> obtenerUsuarios() async {
    final response = await http.get("http://192.168.0.11/pruebas/obtenerUsuarios.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("LISTA DE USUARIOS"),
      ),

      body: new FutureBuilder<List> (
        future: obtenerUsuarios(),
        builder: (context, snapshot) {
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ElementoLista(
            lista: snapshot.data,
          )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),

      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(
            new MaterialPageRoute(builder: (BuildContext context) => new AgregarUsuario(),
            )
          ),
      ),
    );
  }
}

class ElementoLista extends StatelessWidget {

  final List lista;

  ElementoLista({ this.lista });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
      itemCount: lista == null ? 0 : lista.length,
      itemBuilder: (context, posicion) {
        return new Container(
          padding: EdgeInsets.all(2.0),
          child: new GestureDetector(
            onTap: () {

              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context) => new DetallesUsuario(
                    index: posicion,
                    lista: lista,
                  ),
                )
              );
            },

            child: new Card(
              color: Colors.deepPurple,
              child: new Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  lista[posicion]['idUsuario']+": "+lista[posicion]['nombre'],
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),

          ),
        );
      },
    );
  }
}

