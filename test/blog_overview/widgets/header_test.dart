import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/blog_overview/widgets/widgets.dart';

import '../../helpers/helpers.dart';

void main() {
  group('Header', () {
    testWidgets('renders', (tester) async {
      await tester.pumpApp(
        const Header(
          title: 'Test',
          subtitle: 'Test',
        ),
      );

      expect(find.byType(Header), findsOneWidget);
    });
  });
}
