import 'package:animate_do/animate_do.dart';
import 'package:app_movil_estudiante/global/environment.dart';
import 'package:app_movil_estudiante/search/search_delegate.dart';
import 'package:app_movil_estudiante/widgets/form_field_input/form_field_input.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class BuscarAuxiliaresPage extends StatefulWidget {
  BuscarAuxiliaresPage({
    Key key,
  }) : super(key: key);

  @override
  _BuscarAuxiliaresPageState createState() => _BuscarAuxiliaresPageState();
}

final nombreCtrl = TextEditingController();

class _BuscarAuxiliaresPageState extends State<BuscarAuxiliaresPage> {
  List asignaturas;

  @override
  void initState() {
    _cargarAsignaturas();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 171.0, start: -28.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xff40bdf3),
              ),
            ),
          ),
          Positioned(
              top: 50,
              left: 14,
              child: Row(
                children: [
                  FadeInLeft(
                    duration: Duration(milliseconds: 300),
                    child: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ),
                ],
              )),
          Pinned.fromPins(
            Pin(size: 195.0, start: 70.0),
            Pin(size: 24.0, start: 62.5),
            child: Text(
              'Buscar ',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: FadeInDown(
                duration: Duration(milliseconds: 300),
                child: buildSearchBar(context)),
          ),
          Pinned.fromPins(
            Pin(size: 166.0, start: 28.0),
            Pin(size: 20.0, middle: 0.2524),
            child: Text(
              'Lista de Asignaturas',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: const Color(0xff313450),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(start: 190, end: 0.0),
            child: // Adobe XD layer: 'Grupo lista de medi…' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: SafeArea(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xffffffff),
                      ),
                      child: new ListView.builder(
                        //   reverse: false,
                        itemCount:
                            asignaturas == null ? 0 : asignaturas.length,
                        itemBuilder: (_, int index) =>
                            EachList(asignaturas[index]["nombre"]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _cargarAsignaturas() async {
    final resp =
        await http.get('${Environment.apiUrl}/especialidad/getespecialidades');
        TODO://cambiar las irl

    final data = json.decode(resp.body);
    // print(data["especialidades"]);
    setState(() {
      asignaturas = data["asignaturas"];
      print(asignaturas.length);
    });
  }
}

class EachList extends StatelessWidget {
  final String name;
  EachList(this.name);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed('detalle');
        Navigator.pushNamed(context, 'detalle', arguments: name);
      },
      child: new Card(
        child: new Container(
          padding: EdgeInsets.all(8.0),
          child: new Row(
            children: <Widget>[
              new CircleAvatar(
                child: new Text(name[0]),
              ),
              new Padding(padding: EdgeInsets.only(right: 10.0)),
              new Text(
                name,
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildSearchBar(BuildContext context) {
 
  var search = '';

  return SafeArea(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 15),
        FormFieldInput(
          placeholder: "Buscando...",
          labelText: "Auxilares...",
          suffixIcon: Icon(Icons.search),
          textController: nombreCtrl,
          textCapitalization: TextCapitalization.words,
          onChanged: (value) {
            // persona.nombre = value;
            search = value;
          },
          onTap: () {
            showSearch(context: context, delegate: DataSearch());
          },
        ),
      ],
    ),
  );
}
