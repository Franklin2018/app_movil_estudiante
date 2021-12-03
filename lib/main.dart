import 'package:app_movil_estudiante/routes/routes.dart';
import 'package:app_movil_estudiante/services/BottomNavigationBarServices/ui_provider.dart';
import 'package:app_movil_estudiante/services/estudiante_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => EstudianteService()), 
          ChangeNotifierProvider(create: (_) => UiProvider()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yo Estudiante',
         initialRoute: 'welcome',
         routes: appRoutes,
         theme: ThemeData(
              primaryColor: Color.fromARGB(255, 91, 198, 244),
            ),
      ),
    );
  }
}