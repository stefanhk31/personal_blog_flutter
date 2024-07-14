// ignore_for_file: prefer_const_constructors

import 'package:aws_models/aws_models.dart';
import 'package:test/test.dart';

void main() {
  group('Subject', () {
    const subject = Subject(
      charset: 'charset',
      data: 'data',
    );

    test('can be instantiated', () {
      expect(subject, isNotNull);
    });

    test('supports value equality', () {
      expect(
        subject,
        equals(
          Subject(
            charset: 'charset',
            data: 'data',
          ),
        ),
      );
    });

    group('JSON serialization', () {
      final subjectJson = {
        'charset': 'charset',
        'data': 'data',
      };

      test('can create Subject from JSON', () {
        expect(Subject.fromJson(subjectJson), isA<Subject>());
      });

      test('can map a Subject to JSON', () {
        expect(subject.toJson(), equals(subjectJson));
      });
    });
  });
}
