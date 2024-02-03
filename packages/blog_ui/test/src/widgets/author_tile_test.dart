import 'package:blog_ui/src/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_material.dart';

void main() {
  group('AuthorTile', () {
    testWidgets('renders without image', (tester) async {
      await tester.pumpMaterial(const AuthorTile(author: 'author'));

      expect(find.byType(AuthorTile), findsOneWidget);
      expect(find.byType(AuthorAvatar), findsNothing);
    });

    testWidgets('renders with image', (tester) async {
      await tester.pumpMaterial(
        const AuthorTile(
          author: 'author',
          authorImage: 'authorImage',
        ),
        mockNetworkImages: true,
      );

      expect(find.byType(AuthorTile), findsOneWidget);
      expect(find.byType(AuthorAvatar), findsOneWidget);
    });
  });
}
