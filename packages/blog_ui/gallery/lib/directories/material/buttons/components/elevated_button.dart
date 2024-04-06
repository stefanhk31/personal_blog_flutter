import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class ElevatedButtonComponent extends WidgetbookComponent {
  ElevatedButtonComponent()
      : super(
          name: 'ElevatedButton',
          useCases: [
            _ElevatedButtonUseCase(),
            _ElevatedButtonIconUseCase(),
          ],
        );
}

class _ElevatedButtonUseCase extends WidgetbookUseCase {
  _ElevatedButtonUseCase()
      : super(
          name: 'ElevatedButton',
          builder: (context) {
            return ElevatedButton(
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

class _ElevatedButtonIconUseCase extends WidgetbookUseCase {
  _ElevatedButtonIconUseCase()
      : super(
          name: 'ElevatedButton.icon',
          builder: (context) {
            return ElevatedButton.icon(
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
