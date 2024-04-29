import 'dart:async';
import 'dart:io';

import 'package:aula06_api/config.dart';
import 'package:aula06_api/models/pokemon.dart';
import 'package:aula06_api/services/cliente_http.dart';

class PokemonRemote {
  final _clienteHttp = ClienteHttp();

  Future<List<Pokemon>> get() async {
    final lista = await _clienteHttp.getJson(linkAPI);

    await Future.delayed(Duration(seconds: 3));

    return lista.map((e) => Pokemon(nome: e["name"], url: e["url"])).toList();
    /*
    List<Pokemon> listaPoke = [];
    for (int i = 0; i < lista.length; i++) {
      final poke = Pokemon(nome: lista[i]["name"], url: lista[i]["url"]);
      listaPoke.add(poke);
    }
    return listaPoke;
    */
  }
}