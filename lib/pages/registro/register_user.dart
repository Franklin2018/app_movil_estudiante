import 'package:app_movil_estudiante/pages/registro/formEstudiante.dart';
//import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_movil_estudiante/models/persona.dart';
import 'package:app_movil_estudiante/models/usuario.dart';
import 'package:app_movil_estudiante/pages/Registro/formUsuario.dart';
import 'package:app_movil_estudiante/bloc/estudiante_bloc.dart';
import 'package:app_movil_estudiante/models/foto.dart';
import 'package:app_movil_estudiante/models/estudiante.dart';
//import 'package:app_movil_estudiante/models/user_register.dart';
//import 'package:app_movil_estudiante/services/upload_service.dart';

class RegisterUserPage extends StatefulWidget {
  RegisterUserPage({Key key}) : super(key: key);

  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();

  static _RegisterUserPageState of(BuildContext context) =>
      context.findAncestorStateOfType<_RegisterUserPageState>();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  FormUsuario formUsuario = FormUsuario();
  FormEstudiante formEstudiante = FormEstudiante();

  List<Step> steps;
  int currentStep = 0;
  bool complete = false;
  Estudiante estudiante = Estudiante();
  Persona persona = Persona();
  Usuario usuario = Usuario();
  Foto foto = Foto();
  StepperType stepperType = StepperType.horizontal;


 
  final estudianteBloc = EstudianteBloc();
  //FileUploadService fileuploadService = FileUploadService();

  switchStepType() {
    setState(() => stepperType == StepperType.horizontal
        ? stepperType = StepperType.vertical
        : stepperType = StepperType.horizontal);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  @override
  void dispose() {
   

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _systemChromeColor(Brightness.dark);

    // pacienteServiciosBloc =
    //     Provider.of<PacienteServiciosBloc>(context, listen: false);
    steps = crearSteps(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            complete
                ? Expanded(
                    child: Center(
                      child: AlertDialog(
                        title: new Text("Usuario Creado con exito"),
                        content: new Text(
                          "El registro de ${usuario.correo} se ha completado exitosamente, ingrese para continuar",
                        ),
                        actions: <Widget>[
                          // ignore: deprecated_member_use
                          new FlatButton(
                            child: new Text("Inicio"),
                            onPressed: () {
                              setState(() {});
                              Navigator.pushNamedAndRemoveUntil(context,
                                  'login', (Route<dynamic> route) => false);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: Stepper(
                      type: stepperType,
                      steps: steps,
                      controlsBuilder: (context,
                          {onStepCancel, onStepContinue}) {
                        return Row(
                          children: [
                            Container(
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                child: Text(
                                  "Atras",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                onPressed: onStepCancel,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Container(
                              color: !formUsuario.validate
                                  ? Colors.grey
                                  : Colors.blue,
                              child: TextButton(
                                child: Text(
                                  "Siguiente",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: !formUsuario.validate
                                    ? null
                                    : () => {
                                          print(estudiante.toJson()),
                                          onStepContinue(),
                                        },
                              ),
                            )
                          ],
                        );
                      },
                      currentStep: currentStep,
                      onStepContinue: next,
                      // onStepTapped: (step) => goTo(step),
                      onStepCancel: cancel,
                    ),
                  ),
          ],
        ),
      ),
  
    );
  }

  next() async {
    bool estaValidado;

    switch (currentStep) {
      case 0:
        estaValidado = formUsuario.formKey.currentState.validate();

        estaValidado ? formUsuario.formKey.currentState.save() : null;
        // estaValidado = true;
        break;
      case 1:
        estaValidado = formEstudiante.formKey.currentState.validate();
        print(estaValidado);
        if (estaValidado) {
          await registrarEstudiante(context);
        }

        break;
      default:
        estaValidado = false;
    }
    estaValidado = true;

    if (estaValidado) {
      if (currentStep + 1 != steps.length) {
        goTo(currentStep + 1);
      } else {
        setState(() {
          complete = true;
        });
      }
    }
  }
  // crear selecccionar Categoria Servicios y horarios

  Widget botonesFlotantes() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 30.0,
        ),
        Visibility(
          visible: false,
          child: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              // cancel();
            },
            backgroundColor: false ? Colors.blue : Colors.grey[350],
            splashColor: Colors.red,
            foregroundColor: Colors.grey[100],
          ),
        ),
        Expanded(child: SizedBox()),
        Visibility(
          visible: false,
          child: FloatingActionButton(
              child: Icon(Icons.list_alt),
              onPressed: () {
                switchStepType();
              }),
        ),
        SizedBox(
          width: 5.0,
        ),
        Visibility(
          visible: false,
          child: FloatingActionButton(
            child: Icon(Icons.arrow_forward),
            onPressed: () {
              next();
            },
          ),
        ),
      ],
    );
  }

  currentStepState(int step) {
    if (currentStep < step) {
      return StepState.indexed;
    } else if (currentStep == step) {
      return StepState.editing;
    } else {
      return StepState.complete;
    }
  }

  List<Step> crearSteps([BuildContext context]) {
    return [
      Step(
        title: Text('Datos Personales'),
        isActive: currentStep >= 0,
        state: currentStepState(0),
        content: Column(
          children: <Widget>[
            const SizedBox(height: 10.0),
            formUsuario,
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      Step(
        isActive: currentStep >= 1,
        state: currentStepState(1),
        title: Text('Datos Complementarios'),
        content: Column(
          children: <Widget>[
            const SizedBox(height: 10.0),
            formEstudiante,
            SizedBox(
              height: 20,
            ),
          ],
        ),
      )
    ];
  }

  registrarEstudiante(BuildContext context) async {
    print('ANTES ACTION');

    // final notificacion =
    //     Provider.of<NotificationsService>(context, listen: false);

   // usuario.img_perfil = await fileuploadService.subirImagen(foto.value);
    // print(usuario.toJson());
    // print(persona.toJson());
    // print(estudiante.toJson());
    await estudianteBloc.registrarEstudiante(usuario, persona, estudiante);

    //await notificacion.guardarTokenFCMByEmailServices(userRegister.email);

    print('END ACTION');
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
