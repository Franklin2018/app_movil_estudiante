import 'package:app_movil_estudiante/pages/registro/register_user.dart';
import 'package:app_movil_estudiante/widgets/form_field_input/form_field_input.dart';
import 'package:flutter/material.dart';
import 'package:app_movil_estudiante/helpers/input_formatter.dart';
import 'package:app_movil_estudiante/helpers/validar.dart';
import 'package:app_movil_estudiante/models/persona.dart';
import 'package:app_movil_estudiante/models/usuario.dart';
//import 'package:app_movil_estudiante/widgets/checkbox_w.dart';


// typedef SCallback = Function(Trabajador persona);

class FormEstudiante extends StatefulWidget {
  final Function(Usuario, Persona) callback;

  FormEstudiante({Key key, this.callback}) : super(key: key);

  final bool validate = true;
  final formKey = GlobalKey<FormState>();
  // final PickedFile foto = Pick;

  // static F_formPacienteState of(BuildContext context) =>
  //     context.findAncestorStateOfType<F_formPacienteState>();

  @override
  F_formEstudianteState createState() => F_formEstudianteState();
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

class F_formEstudianteState extends State<FormEstudiante> {
  @override

  BuildContext get context => super.context;

  @override
  void dispose() {
    // RegisterTrabajadorPage.of(context).persona = persona;
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
    final estudiante = RegisterUserPage.of(context).estudiante;

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
           FormFieldInput(
                  placeholder: "Carrera",
                  labelText: "Carrera *",
                  textController: nombreCtrl,
                  // keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) =>
                      validar.validarCampoRequerido(value, 'carrera'),
                  onChanged: (value) {
                    estudiante.carrera = value;
                    print(estudiante.toJson());
                  },
                ),
          SizedBox(
            height: 30,
            child: Divider(),
          ),
         
          SizedBox(
            height: 30,
            child: Divider(),
          ),
          SizedBox(
            height: 30,
            child: Divider(),
          ),
          SizedBox(
            height: 30,
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
