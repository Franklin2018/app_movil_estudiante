import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageCircleWidget extends FormField<PickedFile> {
  final fotoUrl;
  final height;
  final padding;
  ImageCircleWidget({Key key, this.fotoUrl, this.height, this.padding})
      : super(builder: (FormFieldState<PickedFile> state) {
          return vistaFoto(fotoUrl, height, padding);
        });
}

Widget vistaFoto(String fotoUrl, double height, double padding) {
  // var height = MediaQuery.of(context).size.height;
  return Container(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: 100,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 10),
                blurRadius: 15,
                // spreadRadius: 3,
              )
            ], shape: BoxShape.circle, color: Colors.white),
            height: height,
            padding: EdgeInsets.all(padding ?? 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage(
                  'assets/icon-loading.gif',
                  // package: 'flutter_gallery_assets',
                ),
                image: NetworkImage(fotoUrl),
              ),
            )),
      ],
    ),
  );
}

// Future _seleccionarFoto(
//     BuildContext context, FormFieldState<PickedFile> state) async {
//   showDialog(
//     context: context,
//     builder: (_) => new AlertDialog(
//       content: Container(
//         height: 150,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             BotonPrincipal(
//                 text: "ACTIVAR CAMARA",
//                 onPressed: () async {
//                   await _procesarImagen(ImageSource.camera).then((value) {
//                     if (value != null) {
//                       state.didChange(value);
//                     }
//                   });
//                   Navigator.pop(context);
//                   print('poped');
//                 }),
//             SizedBox(
//               height: 10,
//             ),
//             BotonPrincipal(
//                 text: "ABRIR GALERIA",
//                 onPressed: () async {
//                   await _procesarImagen(ImageSource.gallery).then((value) {
//                     if (value != null) {
//                       state.didChange(value);
//                     }
//                   });
//                   Navigator.pop(context);
//                 }),
//           ],
//         ),
//       ),
//       actions: [
//         FlatButton(
//             onPressed: () => Navigator.pop(context), child: Text('Cerrar')),
//       ],
//     ),
//   );
// }

// Future<PickedFile> _procesarImagen(ImageSource origen) async {
//   final ImagePicker _picker = ImagePicker();

//   PickedFile foto = await _picker.getImage(source: origen);
//   if (foto == null) {
//     print('foto nula');
//   } else {
//     print('foto cargada');
//   }
//   return foto;
// }
