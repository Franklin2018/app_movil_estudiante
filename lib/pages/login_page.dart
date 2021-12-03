import 'package:app_movil_estudiante/models/estudiante.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_movil_estudiante/helpers/mostrar_alerta.dart';
import 'package:app_movil_estudiante/helpers/validar.dart';
import 'package:app_movil_estudiante/pages/Registro/formUsuario.dart';
import 'package:app_movil_estudiante/services/estudiante_service.dart';
// import 'package:app_movil_estudiante/services/notification_service.dart';
import 'package:app_movil_estudiante/widgets/boton_principal.dart';
import 'package:app_movil_estudiante/widgets/form_field_input/form_field_input.dart';
import 'package:app_movil_estudiante/widgets/logo/appname_widget.dart';
import 'package:app_movil_estudiante/widgets/logo/logo_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  // LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final validar = Validar();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _systemChromeColor(Brightness.dark);
    final size = MediaQuery.of(context).size;
    final color = Theme.of(context).primaryColor;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * .9,
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  child: Text('Login',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w300)),
                ),
                _crearLogo(size, color),
                Expanded(child: SizedBox()),
                Text(
                  'Ingresa tus credenciales',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 124, 125, 126)),
                ),
                _Form(),
                SizedBox(height: 20),
                Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 124, 125, 126)),
                ),
                SizedBox(height: 30),
                _noTienesCuenta(context),
                SizedBox(
                  height: 0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _crearLogo(Size size, Color color) {
    return Hero(
        tag: 'logo',
        transitionOnUserGestures: true,
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            children: [
              LogoWidget(width: size.width),
              AppNameWidget(width: size.width, color: color)
            ],
          ),
        ));
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

Widget _noTienesCuenta(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '¿No tienes una cuenta? ',
        style:
            TextStyle(fontSize: 14, color: Color.fromARGB(255, 124, 125, 126)),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'register_usuario');
        },
        child: Text(
          'Registrate',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Theme.of(context).primaryColor),
        ),
      ),
    ],
  );
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final estudianteService = Provider.of<EstudianteService>(context);
    // final notificacion =
    //     Provider.of<NotificationsService>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            FormFieldInput(
              validator: (value) {
                return validar.validarEmail(value, true);
              },
              onChanged: null,
              placeholder: 'Email',
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
              textController: emailCtrl,
            ),
            SizedBox(height: 20),
            FormFieldInput(
              validator: (value) {
                return validar.validarPassword(value);
              },
              onChanged: null,
              placeholder: 'Contraseña',
              labelText: 'Contraseña',
              textController: passCtrl,
              isPassword: true,
            ),
            SizedBox(height: 20),
            BotonPrincipal(
              text: 'Ingrese',
              onPressed: estudianteService.autenticando
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final formValidate = formKey.currentState.validate();

                      if (!formValidate) return null;

                      final loginOk = await estudianteService.login(
                          emailCtrl.text.trim(), passCtrl.text.trim());

                      if (loginOk) {
                        // notificacion.guardarTokenFCMServices();
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'home', (Route<dynamic> route) => false);
                      } else {
                        mostrarAlerta(context, 'Login incorrecto',
                            'Revise sus Credenciales');
                      }
                    },
            )
          ],
        ),
      ),
    );
  }
}
