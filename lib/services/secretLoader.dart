
import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_movies/models/Secrets.dart';


class SecretLoader {

  final String path;

  SecretLoader({ this.path });

  Future<Secret> load() {

    var parser = (String jsonString) async {
      return Secret.fromJson(json.decode(jsonString));
    };

    return rootBundle.loadStructuredData<Secret>(path, parser);
  }
}


// is it a number
//   yes - 
//        does it fall between the current year and max year
//             yes - return true number is valid
//             no - return false number is valid
//   no - return number is not valid
