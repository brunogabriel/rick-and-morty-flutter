import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty/character/data/service/character_service.dart';

void main() {
  group('character service status ok', () {
    late Dio client;
    late CharacterService service;
    setUp(() async {
      client = DioMock();
      service = CharacterServiceImpl(client);
    });

    test(
        'GIVEN http client '
        'WHEN request characters at first page '
        'THEN get valid answer', () async {
      final response = ResponseMock();
      final dynamic dynamicResponse = {
        'results': [],
        'info': {
          'count': 919,
          'pages': 2,
          'next': null,
          'prev': null,
        },
      };

      when(() => response.statusCode).thenReturn(200);
      when(() => response.data).thenReturn(dynamicResponse);
      when(() => client.get('character', queryParameters: {'page': '1'}))
          .thenAnswer((_) async => response);
      var result = await service.getCharacters();
      expect(result.info.count, 919);
    });
  });

  group('character service status invalid', () {
    late Dio client;
    late CharacterService service;
    setUp(() async {
      client = DioMock();
      service = CharacterServiceImpl(client);
    });

    test(
        'GIVEN http client '
        'WHEN request characters at first page '
        'THEN get 404 and exception', () async {
      final response = ResponseMock();
      when(() => response.statusCode).thenReturn(404);
      when(() => client.get('character', queryParameters: {'page': '1'}))
          .thenAnswer((_) async => response);
      expect(() => service.getCharacters(), throwsA(isA<HttpException>()));
    });
  });
}

class DioMock extends Mock implements Dio {}

class ResponseMock extends Mock implements Response<dynamic> {}
