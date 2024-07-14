// ignore_for_file: prefer_const_constructors

import 'package:aws_models/aws_models.dart';
import 'package:test/test.dart';

void main() {
  group('ListManagementOptions', () {
    const listManagementOptions = ListManagementOptions(
      contactListName: 'contactListName',
      topicName: 'topicName',
    );
    test('can be instantiated', () {
      expect(listManagementOptions, isNotNull);
    });

    test('supports value equality', () {
      expect(
        listManagementOptions,
        equals(
          ListManagementOptions(
            contactListName: 'contactListName',
            topicName: 'topicName',
          ),
        ),
      );
    });

    group('JSON serialization', () {
      final listManagementOptionsJson = {
        'contactListName': 'contactListName',
        'topicName': 'topicName',
      };

      test('can create ListManagementOptions from JSON', () {
        expect(
          ListManagementOptions.fromJson(listManagementOptionsJson),
          isA<ListManagementOptions>(),
        );
      });

      test('can map a ListManagementOptions to JSON', () {
        expect(
          listManagementOptions.toJson(),
          equals(listManagementOptionsJson),
        );
      });
    });
  });
}
