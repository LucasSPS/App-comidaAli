import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetAdressCall {
  static Future<ApiCallResponse> call({
    String? latLng = '',
    String? apiKey = 'AIzaSyDNqGM8G6F1Ohkh_XSkMak5c1Bk0VWwGUU',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAdress',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latLng}&key=${apiKey}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic bairro(dynamic response) => getJsonField(
        response,
        r'''$.results[2].address_components[1].long_name''',
      );
  static dynamic cidade(dynamic response) => getJsonField(
        response,
        r'''$.results[2].address_components[2].short_name''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
