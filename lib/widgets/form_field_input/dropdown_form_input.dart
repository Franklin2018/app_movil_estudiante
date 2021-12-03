import 'package:flutter/material.dart';

class DropdownFormInput extends StatelessWidget {
  final String placeholder;
  final Function validator;
  final Function onChanged;
  final Function onTap;
  final String value;
  final List<String> items;

  // const GlobalKey<FormFieldState> fieldFormKey = GlobalKey<FormFieldState>();
  final TextInputType keyboardType;
  final String labelText;
  final String hintText;
  final Icon suffixIcon;

  const DropdownFormInput(
      //const
      {Key key,
      @required this.placeholder,
      @required this.validator,
      @required this.value,
      @required this.items,
      this.onChanged,
      this.onTap,
      this.keyboardType = TextInputType.text,
      this.labelText = '',
      this.hintText = '',
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        value: value,
        hint: Text('data'),

        // : this.hintText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 242, 242, 242),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25),
          ),
          labelText: this.labelText,
        ),
        onChanged: this.onChanged,
        items: getOpcionesDropdown(),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    items.forEach((item) {
      lista.add(DropdownMenuItem(
        child: Text("$item"),
        value: item,
      ));
    });

    return lista;
  }
}
