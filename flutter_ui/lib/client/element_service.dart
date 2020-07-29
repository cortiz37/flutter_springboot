import 'dart:async';

import 'package:flutter_ui/client/rest.dart';

final ElementService elementService = ElementService._private();

class ElementService {
  ElementService._private();

  Future<Iterable> getElements() async {
    final response = await Rest.requestGet('/elements/');

    switch (response.statusCode) {
      case 200:
        return Rest.decodeResponse(response);
        break;
      default:
        throw Exception('request failed');
    }
  }
}
