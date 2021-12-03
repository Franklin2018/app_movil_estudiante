import 'package:app_movil_estudiante/pages/home_page.dart';
import 'package:app_movil_estudiante/pages/login_page.dart';
import 'package:app_movil_estudiante/pages/registro/register_user.dart';
import 'package:app_movil_estudiante/pages/welcome_page.dart';
import 'package:flutter/material.dart';


final Map<String, Widget Function(BuildContext)> appRoutes = {
 // 'loading': (BuildContext c) => LoadingPage(),
 'welcome': (BuildContext c) => WelcomePage(),
 'register_usuario': (BuildContext c) => RegisterUserPage(),
 'login': (BuildContext c) => LoginPage(),
 'home': (BuildContext c) => HomePage(),

  
};