import 'package:blog_ui/blog_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_material.dart';

void main() {
  group('AuthorAvatar', () {
    testWidgets('renders', (tester) async {
      await tester.pumpMaterial(
        const AuthorAvatar(
          imageUrl: 'imageUrl',
        ),
        mockNetworkImages: true,
      );

      expect(find.byType(AuthorAvatar), findsOneWidget);
    });
  });
}
