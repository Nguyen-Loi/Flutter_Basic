import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);
  Future getData() async {
    Response reponse = await get(Uri.parse(url));
    if (reponse.statusCode == 200) {
      String data = reponse.body;
      var decodeData = jsonDecode(data);
      return decodeData;
    } else {
      print(reponse.statusCode);
    }
  }
}
