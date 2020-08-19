import 'dart:async';

import 'package:flutter_ui/client/rest.dart';
import 'package:flutter_ui/domain/element_entity.dart';

final ElementService elementService = ElementService._private();

class ElementService {
  ElementService._private();

  Future<List<ElementEntity>> getElements() async {
    final response = await Rest.requestGet('/elements/');

    switch (response.statusCode) {
      case 200:
        return List.of(Rest.decodeResponse(response))
            .map((o) => ElementEntity.fromJson(o))
            .toList();
      default:
        throw Exception('request failed');
    }
  }

  Future<bool> deleteElement(String id) async {
    final response = await Rest.requestDelete('/elements/$id');

    switch (response.statusCode) {
      case 204:
        return true;
        break;
      case 404:
        return false;
        break;
      default:
        throw Exception('request failed');
    }
  }
}
