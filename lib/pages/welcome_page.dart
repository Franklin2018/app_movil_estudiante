import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_movil_estudiante/widgets/boton_principal.dart';
import 'package:app_movil_estudiante/widgets/customClipper.dart';
import 'package:app_movil_estudiante/widgets/logo/appname_widget.dart';
import 'package:app_movil_estudiante/widgets/logo/logo_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Theme.of(context).primaryColor;
    _systemChromeColor(Brightness.light);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [_crearFondo(context), _crearLogo(size, color)],
            ),
          ),
          Expanded(flex: 3, child: _bodyApp(size, color, context))
        ]),
      ),
    );
  }

  Widget _bodyApp(Size size, Color color, BuildContext context) {
    return Container(
      width: size.width,
      child: Column(
        children: [
          Container(
            width: size.width,
            padding: EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
            alignment: Alignment.center,
            child: Text(
              'Busca e inscribete a auxiliaturas en linea con auxiliares calificados',
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.3,
                  color: Color.fromARGB(255, 124, 125, 126),
                  fontFamily: 'Metropolis'),
            ),
          ),
          Expanded(child: SizedBox()),
          Container(
            width: size.width * .8,
            child: Column(
              children: [
                BotonPrincipal(
                    text: 'Login',
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    }),
                SizedBox(
                  height: 20,
                ),
                BotonPrincipal(
                    text: 'Crear una Cuenta',
                    color: Colors.white,
                    textColor: color,
                    onPressed: () {
                      Navigator.pushNamed(context, 'register_usuario');
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget _crearLogo(Size size, Color color) {
    return Positioned(
      bottom: 10,
      child: Hero(
        tag: "logo",
        transitionOnUserGestures: true,
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            children: [
              LogoWidget(width: size.width),
              AppNameWidget(width: size.width, color: color),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    final size = MediaQuery.of(context).size;

    final circulo = (double w, [double h]) => Container(
        width: w,
        height: h ?? w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(180),
          color: Color.fromARGB(53, 255, 255, 255),
        ));

    var ctsw = size.width / 375;
    var ctsh = size.height * .5 / 382;
    return Container(
      height: size.height * .5,
      child: CustomPaint(
        painter: _ClipShadowShadowPainter(
            clipper: ClipPainter(),
            shadow: Shadow(
                blurRadius: 15,
                offset: Offset(0, 15),
                color: Color.fromARGB(70, 74, 75, 77))),
        child: ClipPath(
            clipper: ClipPainter(),
            child: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: color,
              ),
              Positioned(
                  top: -55 * ctsh, left: -62 * ctsw, child: circulo(178)),
              Positioned(top: 77 * ctsh, left: 20 * ctsw, child: circulo(105)),
              Positioned(
                  top: -159 * ctsh, left: 165 * ctsw, child: circulo(289)),
              Positioned(top: 130 * ctsh, left: 223 * ctsw, child: circulo(29)),
              Positioned(top: 118 * ctsh, left: 150 * ctsw, child: circulo(18)),
              Positioned(top: 219 * ctsh, left: 152 * ctsw, child: circulo(13)),
              Positioned(
                  top: 161 * ctsh, left: 288 * ctsw, child: circulo(130)),
              Positioned(top: 328 * ctsh, left: 360 * ctsw, child: circulo(21)),
              Positioned(
                  top: 219 * ctsh, left: -89 * ctsw, child: circulo(232)),
            ])),
      ),
    );
  }

  void _systemChromeColor(Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: brightness,
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.transparent,
      ),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}