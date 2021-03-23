import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

void main() async {
  print('ecrire ton nom ');
  var name = stdin.readLineSync();

  if (name != '') {
    Map<String, Object> queryParams = <String, Object>{
      'name': getName(name: name),
      'country_id': 'FR'
    };
    dynamic url = Uri.https('api.agify.io', '/', queryParams);
    var response = await getRequest(url: url);
    print(response['name']);
  }
}

Future<dynamic> getRequest({required Uri url}) async {
  try {
    var resp = await http.get(url);
    return jsonDecode(resp.body);
  } catch (err) {
    return err;
  }
}

Future<dynamic> getName({String? name = 'Eduard'}) {
  return Future.value(name);
}
