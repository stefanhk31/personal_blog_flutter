import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class FeaturedImageComponent extends WidgetbookComponent {
  FeaturedImageComponent()
      : super(
          name: 'FeaturedImage',
          useCases: [
            _FeaturedImageUseCase(),
          ],
        );
}

class _FeaturedImageUseCase extends WidgetbookUseCase {
  _FeaturedImageUseCase()
      : super(
          name: 'FeaturedImage',
          builder: (context) => const Center(
            child: FeaturedImage(
              imageUrl: 'https://picsum.photos/200',
            ),
          ),
        );
}
