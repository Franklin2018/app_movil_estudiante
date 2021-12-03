import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_movil_estudiante/widgets/boton_principal.dart';

class ImageFormInput extends FormField<PickedFile> {
  final BuildContext context;
  final FormFieldSetter<PickedFile> onSaved;
  final FormFieldValidator<PickedFile> validator;
  final TextInputType keyboardType;
  final String labelText;
  final bool isPassword;
  final Icon suffixIcon;
  final PickedFile foto;
  ImageFormInput(
      {
      // @required this.placeholder,
      // @required this.textController,
      @required this.context,
      @required this.validator,
      @required this.onSaved,
      this.keyboardType = TextInputType.text,
      this.labelText = '',
      this.isPassword = false,
      this.foto,
      this.suffixIcon})
      : super(
            onSaved: onSaved,
            initialValue: foto,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            builder: (FormFieldState<PickedFile> state) {
              return vistaFoto(context, state);
            });
}

Widget vistaFoto(BuildContext context, FormFieldState<PickedFile> state) {
  var primaryColor = Theme.of(context).primaryColor;
  return GestureDetector(
    onTap: () async {
      await _seleccionarFoto(context, state);
      // state.validate();
    },
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              minRadius: 30.0,
              maxRadius: 30.0,
              backgroundImage: (state.value?.path == null)
                  ? AssetImage('assets/no-img-setting.png')
                  : FileImage(File(state.value.path))),
          Container(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  color: primaryColor,
                ),
                Text('agregar perfil', style: TextStyle(color: primaryColor)),
              ],
            ),
          ),
          state.hasError
              ? Builder(builder: (context) {
                  return Text(
                    '${state.errorText}',
                    style: TextStyle(color: Colors.red),
                  );
                })
              : Text('')
        ],
      ),
    ),
  );
}

Future _seleccionarFoto(
    BuildContext context, FormFieldState<PickedFile> state) async {
  showDialog(
    context: context,
    builder: (_) => new AlertDialog(
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            BotonPrincipal(
                text: "ACTIVAR CAMARA",
                onPressed: () async {
                  await _procesarImagen(ImageSource.camera).then((value) {
                    if (value != null) {
                      state.didChange(value);
                    }
                  });
                  Navigator.pop(context);
                  print('poped');
                }),
            SizedBox(
              height: 10,
            ),
            BotonPrincipal(
                text: "ABRIR GALERIA",
                onPressed: () async {
                  await _procesarImagen(ImageSource.gallery).then((value) {
                    if (value != null) {
                      state.didChange(value);
                    }
                  });
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      actions: [
        FlatButton(
            onPressed: () => Navigator.pop(context), child: Text('Cerrar')),
      ],
    ),
  );
}

Future<PickedFile> _procesarImagen(ImageSource origen) async {
  final ImagePicker _picker = ImagePicker();

  PickedFile foto = await _picker.getImage(source: origen);
  if (foto == null) {
    print('foto nula');
  } else {
    print('foto cargada');
  }
  return foto;
}
