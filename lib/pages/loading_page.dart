// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:app_movil_telemedicina/pages/home_page.dart';
// import 'package:app_movil_telemedicina/pages/welcome_page.dart';
// import 'package:app_movil_telemedicina/services/auth_service.dart';
// import 'package:app_movil_telemedicina/widgets/logo/appname_widget.dart';
// import 'package:app_movil_telemedicina/widgets/logo/logo_widget.dart';
// import 'package:provider/provider.dart';

// class LoadingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: checkLoginState(context),
//         builder: (context, snapshot) {
//           return Center(
//             child: Hero(
//               tag: 'logo',
//               transitionOnUserGestures: true,
//               child: Material(
//                 type: MaterialType.transparency,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     LogoWidget(width: 300.0),
//                     AppNameWidget(
//                         width: 300.0, color: Theme.of(context).primaryColor),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Future checkLoginState(BuildContext context) async {
//     final authService = Provider.of<AuthService>(context, listen: false);

//     final autenticado = await authService.isLoggedIn();

//     if (autenticado) {
//       Navigator.pushReplacement(
//           context,
//           PageRouteBuilder(
//               pageBuilder: (_, __, ___) => HomePage(),
//               transitionDuration: Duration(milliseconds: 0)));
//     } else {
//       Navigator.pushReplacement(
//           context,
//           PageRouteBuilder(
//               pageBuilder: (_, __, ___) => WelcomePage(),
//               transitionDuration: Duration(milliseconds: 1000)));
//     }
//   }
// }