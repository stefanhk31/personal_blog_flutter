import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class BlogCardComponent extends WidgetbookComponent {
  BlogCardComponent()
      : super(
          name: 'BlogCard',
          useCases: [
            _BlogCardUseCase(),
          ],
        );
}

class _BlogCardUseCase extends WidgetbookUseCase {
  _BlogCardUseCase()
      : super(
          name: 'BlogCard',
          builder: (context) => Padding(
            padding: BlogSpacing.allPadding,
            child: BlogCard(
              title: 'Example Post',
              subtitle: 'This is an example blog post. Pretty neat huh?',
              published: DateTime.now(),
              imageUrl: 'https://picsum.photos/200',
              imageTag: 'Example Image',
              onTap: () {},
            ),
          ),
        );
}
