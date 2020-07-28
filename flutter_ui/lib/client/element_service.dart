import 'dart:async';

import 'package:flutter_ui/client/rest.dart';

final ElementService accessService = ElementService._private();

class ElementService {
  ElementService._private();

  Future<PaginatedResponse> getElements() async {
    final response = await Rest.requestGet('/elements/');

    switch (response.statusCode) {
      case 200:
        return PaginatedResponse.fromJson(Rest.decodeResponse(response));
        break;
      case 401:
        throw SessionExpiredException();
      case 403:
        throw PermissionException();
      default:
        throw Exception('request failed');
    }
  }
}
