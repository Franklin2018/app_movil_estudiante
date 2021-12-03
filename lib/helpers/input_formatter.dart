import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

getInputFormaterCelular() {
  return MaskTextInputFormatter(
      mask: '+591 (#) ###-####', filter: {"#": RegExp(r'[0-9]')});
}
