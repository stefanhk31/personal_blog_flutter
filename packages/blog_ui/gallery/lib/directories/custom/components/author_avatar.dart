import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class AuthorAvatarComponent extends WidgetbookComponent {
  AuthorAvatarComponent()
      : super(
          name: 'AuthorAvatar',
          useCases: [
            _AuthorAvatarUseCase(),
          ],
        );
}

class _AuthorAvatarUseCase extends WidgetbookUseCase {
  _AuthorAvatarUseCase()
      : super(
          name: 'AuthorAvatar',
          builder: (context) => const Center(
            child: AuthorAvatar(
              imageUrl: 'https://picsum.photos/200',
            ),
          ),
        );
}
