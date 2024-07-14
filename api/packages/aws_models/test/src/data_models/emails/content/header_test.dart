// ignore_for_file: prefer_const_constructors

import 'package:aws_models/aws_models.dart';
import 'package:test/test.dart';

void main() {
  group('Header', () {
    const header = Header(
      name: 'name',
      value: 'value',
    );

    test('can be instantiated', () {
      expect(header, isNotNull);
    });

    test('supports value equality', () {
      expect(
        header,
        equals(
          Header(
            name: 'name',
            value: 'value',
          ),
        ),
      );
    });

    group('JSON serialization', () {
      final headerJson = {
        'name': 'name',
        'value': 'value',
      };

      test('can create Header from JSON', () {
        expect(Header.fromJson(headerJson), isA<Header>());
      });

      test('can map a Header to JSON', () {
        expect(header.toJson(), equals(headerJson));
      });
    });
  });
}
