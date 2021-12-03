import 'package:app_movil_estudiante/pages/registro/register_user.dart';
import 'package:flutter/material.dart';
import 'package:app_movil_estudiante/helpers/input_formatter.dart';
import 'package:app_movil_estudiante/helpers/validar.dart';
import 'package:app_movil_estudiante/models/foto.dart';
import 'package:app_movil_estudiante/models/persona.dart';
import 'package:app_movil_estudiante/models/usuario.dart';
import 'package:app_movil_estudiante/widgets/form_field_input/dropdown_form_input.dart';
import 'package:app_movil_estudiante/widgets/form_field_input/form_field_input.dart';
import 'package:app_movil_estudiante/widgets/form_field_input/image_form_input.dart';
import 'package:date_format/date_format.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// typedef SCallback = Function(Trabajador persona);

class FormUsuario extends StatefulWidget {
  final Function(Usuario, Persona, Foto) callback;

  FormUsuario({Key key, this.callback}) : super(key: key);

  final bool validate = true;
  final formKey = GlobalKey<FormState>();
  // final PickedFile foto = Pick;

  // static __FormUsuarioState of(BuildContext context) =>
  //     context.findAncestorStateOfType<__FormUsuarioState>();

  @override
  __FormUsuarioState createState() => __FormUsuarioState();
}

final emailCtrl = TextEditingController();
bool isvalidEmail = true;
final nombreCtrl = TextEditingController();
final apellidoCtrl = TextEditingController();
final celularCtrl = TextEditingController();
final fechaNacimientoCtrl = TextEditingController();
final generoCtrl = TextEditingController(text: "Hombre");
final direccionCtrl = TextEditingController();
final passCtrl = TextEditingController();
final pass2Ctrl = TextEditingController();

final validar = Validar();
// PickedFile foto; 

class __FormUsuarioState extends State<FormUsuario> {
  @override
  
  BuildContext get context => super.context;

  @override
  void dispose() {
    // RegisterUserPage.of(context).persona = persona;
    super.dispose();
    print('dispose');
  }

  @override
  void initState() {
    print('InitState');
    print(emailCtrl.text);
    print(nombreCtrl.text);
  }

  List<String> _generos = ["Hombre", "Mujer"];
  final maskFormatter = getInputFormaterCelular();

  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthService>(context);
    ///////###################################################//////
    var usuario = RegisterUserPage.of(context).usuario;
    var persona = RegisterUserPage.of(context).persona;
    var foto = RegisterUserPage.of(context).foto;
    // final persona = RegisterPacientePage.of(context).persona;
    // final userRegister = RegisterPacientePage.of(context).userRegister;
    // final foto = RegisterPacientePage.of(context).foto;
    // final socketService = Provider.of<SocketService>(context);

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Column(
            children: [
              Container(
                child: Text('Registrate',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w300)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Agrega tus detalles para registrarte',
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 124, 125, 126)),
              )
            ],
          ),
          SizedBox(height: 20.0),
          ImageFormInput(
            context: context,
            foto: foto.value,
            // title: Text('asd'),
            onSaved: (value) {
              foto.value = value;
              print(value.path);
              print('Actulizado');
            },
            validator: (value) {
              return validar.validarAvatar(value?.path);
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: <Widget>[
                // Text(persona.nombre.toString()),
                SizedBox(height: 15),

                FormFieldInput(
                  placeholder: "Nombre",
                  labelText: "Nombre *",
                  textController: nombreCtrl,
                  // keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) =>
                      validar.validarCampoRequerido(value, 'nombre'),
                  onChanged: (value) {
                    persona.nombre = value;
                    print(persona.toJson());
                  },
                ),
                SizedBox(height: 15),
                FormFieldInput(
                  placeholder: "Apellido",
                  labelText: "Apellido *",
                  textCapitalization: TextCapitalization.words,
                  textController: apellidoCtrl,
                  validator: (value) =>
                      validar.validarCampoRequerido(value, 'apellido'),
                  onChanged: (value) {
                    persona.apellidos = value;
                  },
                ),
                SizedBox(height: 15),
                FormFieldInput(
                  keyboardType: TextInputType.phone,
                  placeholder: "Celular",
                  labelText: "Celular *",
                  textController: celularCtrl,
                  inputFormatters: [maskFormatter],
                  validator: (value) =>
                      validar.validarCelular(maskFormatter, 'celular'),
                  onChanged: (value) {
                    persona.celular = value;
                  },
                ),

                SizedBox(height: 15),
                FormFieldInput(
                  keyboardType: TextInputType.phone,
                  placeholder: "Fecha Nacimiento",
                  labelText: "Fecha Nacimiento",
                  textController: fechaNacimientoCtrl,
                  validator: (value) =>
                      validar.validarCampoRequerido(value, 'fecha nacimiento'),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    var picked = await _seleccionarFecha(context);

                    if (picked != null) {
                      persona.fechaNacimiento = picked.toString();
                      fechaNacimientoCtrl.text = picked.toString();
                      // setState(() {});
                    }
                    print(persona.toJson());
                  },
                ),
                SizedBox(height: 15),

                DropdownFormInput(
                  items: ["Hombre", "Mujer"],
                  value: generoCtrl.text,
                  placeholder: "Genero",
                  labelText: "Genero *",
                  validator: (value) =>
                      validar.validarCampoRequerido(value, "Genero"),
                  onChanged: (value) {
                    generoCtrl.text = value;
                    persona.genero = value;
                  },
                  onTap: (value) {
                    persona.genero = value;
                  },
                ),

                SizedBox(height: 15),

                FormFieldInput(
                  keyboardType: TextInputType.streetAddress,
                  placeholder: "Direccion",
                  labelText: "Direccion",
                  textCapitalization: TextCapitalization.sentences,
                  textController: direccionCtrl,
                  validator: (value) {},
                  onChanged: (value) {
                    // setState(() {});
                    persona.direccion = value;
                  },
                ),
                SizedBox(height: 15),
                FormFieldInput(
                  keyboardType: TextInputType.emailAddress,
                  placeholder: "Email",
                  labelText: "Email *",
                  textController: emailCtrl,
                  validator: (value) {
                    //return validar.validarEmail(value, isvalidEmail);
                     //return validar.valida(value, isvalidEmail);
                  },
                  onChanged: (value) async {
                    usuario.correo = value;
                    //isvalidEmail = await validar.validarEmailService(value);
                    setState(() {});
                  },
                ),
                SizedBox(height: 15),
                FormFieldInput(
                  isPassword: true,
                  placeholder: "Contraseña",
                  labelText: "Contraseña *",
                  textController: passCtrl,
                  validator: (value) => validar.validarPassword(value),
                  onChanged: (value) {
                    // user.pass = value;
                    usuario.contrasena = value;
                  },
                ),
                SizedBox(height: 20),
                FormFieldInput(
                  isPassword: true,
                  placeholder: "Confirmar Contraseña",
                  labelText: "Confirmar Contraseña *",
                  textController: pass2Ctrl,
                  validator: (value) =>
                      validar.confirmarPassword(passCtrl.text, value),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _seleccionarFecha(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );
    if (picked == null) return null;
    var formatter = formatDate(picked, [yyyy, '-', M, '-', dd]);
    return formatter;
  }
}
