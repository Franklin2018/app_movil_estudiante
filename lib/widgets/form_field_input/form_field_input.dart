import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var maskFormatter = new MaskTextInputFormatter(
    mask: '+# (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});

class FormFieldInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController textController;
  final Function validator;
  final Function onChanged;
  final Function onTap;
  // const GlobalKey<FormFieldState> fieldFormKey = GlobalKey<FormFieldState>();
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final String labelText;
  final bool isPassword;
  final Icon suffixIcon;
  final List<TextInputFormatter> inputFormatters;

  const FormFieldInput(
      //const
      {Key key,
      @required this.placeholder,
      @required this.textController,
      @required this.validator,
      this.textCapitalization = TextCapitalization.none,
      this.onChanged,
      this.onTap,
      this.inputFormatters,
      this.keyboardType = TextInputType.text,
      this.labelText = '',
      this.isPassword = false,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textCapitalization: this.textCapitalization,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: this.textController,
        validator: this.validator,
        keyboardType: this.keyboardType,
        obscureText: this.isPassword,
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
          hintText: this.placeholder,
          labelText: this.labelText,
          suffixIcon: this.suffixIcon,
        ),
        inputFormatters: this.inputFormatters,
        onChanged: this.onChanged,
        onTap: this.onTap,
      ),
    );
  }
}
