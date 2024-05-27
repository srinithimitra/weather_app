import 'package:clima/utilities/log.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network(this.url);
  final String url;

  Future getData() async {
    
        
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      logger.i(response.statusCode);
    }
  }
}
