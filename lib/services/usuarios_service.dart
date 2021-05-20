import 'package:chap_app/models/usuarios_response.dart';
import 'package:http/http.dart' as http;

import 'package:chap_app/global/environment.dart';
import 'package:chap_app/services/auth_service.dart';
import 'package:chap_app/models/usuarios.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get(Uri.parse('${Environment.apiUrl}/usuarios'),
          headers: {
            'Content-Type': 'application/json',
            'x-token': await AuthService.getToken()
          });

      final usuarioResponse = usuarioResponseFromJson(resp.body);
      return usuarioResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}
