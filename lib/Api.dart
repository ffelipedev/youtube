import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyAzJbRQXo0Fc6WPK77PmdwQORJJTL8r6dQ";
const ID_CANAL = "UCZU9T1ceaOgwfLRq7OKFU4Q";
const URL_BASE = "https://www.googleapis.com//youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(URL_BASE +
        "search"
            //apenas o primeiro usa ? os outros é usado & para passar os parametros
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa");

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
        //return Video.converterJson(map);
      }).toList();

      return videos;

      /*for (var video in dadosJson["items"]) {
       // print("Resultado: " + video.toString());
      }*/

      //print("RESULTADO: " + dadosJson["itens"].toString());
    } else {
      print("erro");
    }
  }
}
