import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class TextButtonComponent extends WidgetbookComponent {
  TextButtonComponent()
      : super(
          name: 'TextButton',
          useCases: [
            _TextButtonUseCase(),
            _TextButtonWithIconUseCase(),
          ],
        );
}

class _TextButtonUseCase extends WidgetbookUseCase {
  _TextButtonUseCase()
      : super(
          name: 'TextButton',
          builder: (context) {
            return TextButton(
              onPressed: () {},
              child: Text(
                context.knobs.string(
                  label: 'Button Text',
                  initialValue: 'Press Me!',
                ),
              ),
            );
          },
        );
}

class _TextButtonWithIconUseCase extends WidgetbookUseCase {
  _TextButtonWithIconUseCase()
      : super(
          name: 'TextButton.icon',
          builder: (context) {
            return TextButton.icon(
              icon: const Icon(Icons.add),
              onPressed: () {},
              label: Text(
                context.knobs.string(
                  label: 'Button Text',
                  initialValue: 'Press Me!',
                ),
              ),
            );
          },
        );
}
