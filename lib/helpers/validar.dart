import 'package:app_movil_estudiante/services/estudiante_service.dart';

class Validar {
  String validarEmail(String email, [valido = true]) {
    if (valido) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);

      if (regExp.hasMatch(email)) {
        return null;
      } else {
        return 'Email no es correcto';
      }
    } else {
      return 'Email ya existe';
    }
  }

  Future<bool> validarEmailService(String email) async {
    print('validaEmailServices---');
    if (email.length < 5 || this.validarEmail(email) != null) {
      return true;
    }
    var trabajadorServices = EstudianteService();
    bool res = await trabajadorServices.validarEmail(email);

    return res;
  }

  String validarPassword(String password) {
    final mincaracteres = 6;
    if (password.length >= mincaracteres) {
      return null;
    } else {
      return 'Deber tener más de $mincaracteres caracteres';
    }
  }

  String confirmarPassword(String password, String password2) {
    if (password == password2) {
      return null;
    } else {
      return 'Contraseña no coincide';
    }
  }

  String validarAvatar(String value) {
    if (value == null) {
      return "El perfil de usuario es obligatorio";
    }
    return null;
  }

  String validarCampoRequerido(String value, String nombreCampo) {
    if (value.length < 1) {
      return "Campo $nombreCampo es obligatorio *";
    }
    return null;
  }

  String validarCelular(value, String nombreCampo) {
    print(value.isFill);
    if (!value.isFill()) {
      return "Numero de $nombreCampo novalido  *";
    }
    return null;
  }
}
