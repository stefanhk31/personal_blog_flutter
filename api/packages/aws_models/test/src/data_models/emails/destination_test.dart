// ignore_for_file: prefer_const_constructors

import 'package:aws_models/aws_models.dart';
import 'package:test/test.dart';

void main() {
  group('Destination', () {
    final destination = Destination(
      toAddresses: const ['email@example.com'],
    );

    test('can be instantiated', () {
      expect(destination, isNotNull);
    });

    test('supports value equality', () {
      expect(
        destination,
        equals(
          Destination(toAddresses: const ['email@example.com']),
        ),
      );
    });

    group('JSON Serialization', () {
      final destinationJson = {
        'toAddresses': ['email@example.com'],
        'ccAddresses': null,
        'bccAddresses': null,
      };

      test('can create Destination from JSON', () {
        expect(Destination.fromJson(destinationJson), isA<Destination>());
      });

      test('can map a Destination to JSON', () {
        expect(destination.toJson(), equals(destinationJson));
      });
    });
  });
}
