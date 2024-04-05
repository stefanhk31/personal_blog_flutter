import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class AuthorTileComponent extends WidgetbookComponent {
  AuthorTileComponent()
      : super(
          name: 'AuthorTile',
          useCases: [
            _AuthorTileUseCase(),
          ],
        );
}

class _AuthorTileUseCase extends WidgetbookUseCase {
  _AuthorTileUseCase()
      : super(
          name: 'AuthorTile',
          builder: (context) => const Padding(
            padding: BlogSpacing.allPadding,
            child: AuthorTile(
              author: 'Stefan Hodges-Kluck',
              authorImage: 'https://picsum.photos/200',
            ),
          ),
        );
}
