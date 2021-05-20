import 'package:chap_app/global/environment.dart';
import 'package:chap_app/models/mensajes_response.dart';
import 'package:chap_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chap_app/models/usuarios.dart';

class ChatService with ChangeNotifier {
  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    try {
      final resp = await http.get(
          Uri.parse('${Environment.apiUrl}/mensajes/$usuarioID'),
          headers: {
            'Content-Type': 'application/json',
            'x-token': await AuthService.getToken()
          });

      final mensajesResponse = mensajesResponseFromJson(resp.body);
      return mensajesResponse.mensajes;
    } catch (e) {
      return [];
    }
  }
}
