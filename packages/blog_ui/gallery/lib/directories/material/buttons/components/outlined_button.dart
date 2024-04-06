import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class OutlinedButtonComponent extends WidgetbookComponent {
  OutlinedButtonComponent()
      : super(
          name: 'OutlinedButton',
          useCases: [
            _OutlinedButtonUseCase(),
            _OutlinedButtonIconUseCase(),
          ],
        );
}

class _OutlinedButtonUseCase extends WidgetbookUseCase {
  _OutlinedButtonUseCase()
      : super(
          name: 'OutlinedButton',
          builder: (context) {
            return OutlinedButton(
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

class _OutlinedButtonIconUseCase extends WidgetbookUseCase {
  _OutlinedButtonIconUseCase()
      : super(
          name: 'OutlinedButton.icon',
          builder: (context) {
            return OutlinedButton.icon(
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
