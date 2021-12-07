import 'package:app_movil_estudiante/pages/myHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:app_movil_estudiante/pages/historial_page.dart';

// import 'package:app_movil_estudiante/pages/perfil_user_page.dart';
import 'package:app_movil_estudiante/services/BottomNavigationBarServices/ui_provider.dart';
import 'package:app_movil_estudiante/services/estudiante_service.dart';
// import 'package:app_movil_estudiante/services/notification_service.dart';
import 'package:app_movil_estudiante/widgets/BottomNavigationBarWidget/custom_navigatorbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final estudianteService = Provider.of<EstudianteService>(context);
    // final notificacion =
    //     Provider.of<NotificationsService>(context, listen: false);
    return Scaffold(
        bottomNavigationBar: CustomNavigationBar(), body: _HomePageBody());
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    // Usar el ScanListProvider
    // final scanListProvider =
    //     Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
      // scanListProvider.cargarScanPorTipo('geo');
        // return Container(
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         MaterialButton(
        //             child: Text('Buscar Medico',
        //                 style: TextStyle(color: Colors.white)),
        //             color: Theme.of(context).primaryColor,
        //             shape: StadiumBorder(),
        //             elevation: 0,
        //             splashColor: Colors.transparent,
        //             onPressed: () async {
        //               await Navigator.pushNamed(context, 'buscarmedico');
        //             }),
        //             Divider( ),
        //              MaterialButton(
        //             child: Text('Fichas Medicas',
        //                 style: TextStyle(color: Colors.white)),
        //             color: Theme.of(context).primaryColor,
        //             shape: StadiumBorder(),
        //             elevation: 0,
        //             splashColor: Colors.transparent,
        //             onPressed: () async {
        //               await Navigator.pushNamed(context, 'fichamedica');
        //             }),
        //              Divider( ),
        //              MaterialButton(
        //             child: Text('home',
        //                 style: TextStyle(color: Colors.white)),
        //             color: Theme.of(context).primaryColor,
        //             shape: StadiumBorder(),
        //             elevation: 0,
        //             splashColor: Colors.transparent,
        //             onPressed: () async {
        //               await Navigator.pushNamed(context, 'homepart');
        //             })
        //       ],
        //     ),
        //   ),
        // ); //MapasPage();

        return MyHomePage();

      case 1:
        // scanListProvider.cargarScanPorTipo('http');
        final estudianteService = Provider.of<EstudianteService>(context);
        // final notificacion =
        //     Provider.of<NotificationsService>(context, listen: false);
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: deprecated_member_use
              RaisedButton(
                child: Text('Logout'),
                onPressed: () async {
                  // await notificacion.borrarTokenFCMServices();
                  estudianteService.logout();
                  Navigator.pushReplacementNamed(context, 'login');
                },
              ),
              Text('Logeado')
            ],
          ),
        ); //DireccionesPage();

      case 2:
        // scanListProvider.cargarScanPorTipo('geo');
        // return PerfilUserPage();
      case 3:
        // scanListProvider.cargarScanPorTipo('geo');
        // return HistorialPage();
       
      default:
        return Container(
          child: Text('TAP 0 Default'),
        );
    }
  }
}
