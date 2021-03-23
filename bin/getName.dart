import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  print('Quel est votre prénom ? : ');
  String? firstName = stdin.readLineSync();

  if (firstName == null || firstName.isEmpty == true) {
    print('Le prénom ne peut pas être vide !');
    exit(-1);
  }

  firstName = firstName.trim();

  print('$firstName, laissez moi cogiter…\n');

  Future.wait(<Future<Object>>[
    guessAge(firstName),
    guessGender(firstName),
    guessNationality(firstName),
  ]).then((List<Object> values) {
    print('$firstName, votre âge moyen est de ${values[0]} ans');
  });
}

Future<num> guessAge(String firstName) {
  return makeRequest('https://api.agify.io/?name=Edouard&country_id=FR')
      .then((dynamic response) => response['age'] as num);
}

Future<String> guessGender(String firstName) {
  return Future.value('TODO');
}

Future<String> guessNationality(String firstName) {
  return Future.value('TODO');
}

Future<Map<dynamic, dynamic>> makeRequest(String url) {
  assert(url.isNotEmpty);

  return http
      .get(Uri.parse(url))
      .then((http.Response response) => response.body)
      .then((String body) => jsonDecode(body));
}
