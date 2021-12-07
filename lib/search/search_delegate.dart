import 'package:app_movil_estudiante/models/listaauxiliar.dart';
import 'package:app_movil_estudiante/services/busqueda_auxiliar_services.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  final peliculas = ['sherk1', 'sherk2', 'ironman'];
  final peliculasRecientes = ['Spiderman', 'Capitan america', 'superman'];

  final busquedaService = new BusquedaAuxliarService();

  String seleccion = '';

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro Appbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea los resultados que vamos a mostrar
    
    return FutureBuilder(
      future: busquedaService.buscarAuxiliares(query),
      builder:
          (BuildContext context, AsyncSnapshot<List<AuxiliarResponse>> snapshot) {
        if (!snapshot.hasError) {
          if (snapshot.hasData) {
            var auxilares = snapshot.data;
            if (auxilares.length == 0) {
              return Center(child: Text('no hay respuesta'));
            }
            return ListView.builder(
              itemCount: auxilares.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: FadeInImage(
                      image: NetworkImage(auxilares[index].usuario.img_perfil),
                      placeholder: AssetImage('assets/no-img.jpg'),
                      width: 50.0,
                      fit: BoxFit.contain,
                    ),
                    title: Text(auxilares[index].persona.nombre),
                    subtitle: Text("Asignatura: " + auxilares[index].auxiliar.especialidad),
                    trailing: Icon(Icons.arrow_right_sharp),
                    onTap: () {
                      close(context, null);
                      Navigator.pushNamed(context, 'reserva', arguments: auxilares[index]);
                    });
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        } else {
          return Center(child: Text("No se pudo conectar con el servidor"));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: busquedaService.buscarAuxiliares(query),
      builder:
          (BuildContext context, AsyncSnapshot<List<AuxiliarResponse>> snapshot) {
        if (!snapshot.hasError) {
          if (snapshot.hasData) {
            var auxiliares = snapshot.data;
            if (auxiliares.length == 0) {
              return Center(child: Text('no hay respuesta'));
            }
            return ListView.builder(
              itemCount: auxiliares.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: FadeInImage(
                      image: NetworkImage(auxiliares[index].usuario.img_perfil),
                      placeholder: AssetImage('assets/no-img.jpg'),
                      width: 50.0,
                      fit: BoxFit.contain,
                    ),
                    title: Text(auxiliares[index].persona.nombre),
                    subtitle: Text("Asignatura: " + auxiliares[index].auxiliar.especialidad),
                    trailing: Icon(Icons.arrow_right_sharp),
                    onTap: () {
                      close(context, null);
                      Navigator.pushNamed(context, 'reserva', arguments: auxiliares[index]);
                    });
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        } else {
          return Center(child: Text("No se pudo conectar con el servidor"));
        }
      },
    );
  }
}
