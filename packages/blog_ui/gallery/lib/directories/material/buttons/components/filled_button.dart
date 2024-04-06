import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class FilledButtonComponent extends WidgetbookComponent {
  FilledButtonComponent()
      : super(
          name: 'Filled Button',
          useCases: [
            _FilledButtonUseCase(),
            _FilledButtonIconUseCase(),
            _FilledButtonTonalUseCase(),
            _FilledButtonTonalIconUseCase(),
          ],
        );
}

class _FilledButtonUseCase extends WidgetbookUseCase {
  _FilledButtonUseCase()
      : super(
          name: 'FilledButton',
          builder: (context) {
            return FilledButton(
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

class _FilledButtonIconUseCase extends WidgetbookUseCase {
  _FilledButtonIconUseCase()
      : super(
          name: 'FilledButton.icon',
          builder: (context) {
            return FilledButton.icon(
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

class _FilledButtonTonalUseCase extends WidgetbookUseCase {
  _FilledButtonTonalUseCase()
      : super(
          name: 'FilledButton.tonal',
          builder: (context) {
            return FilledButton.tonal(
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

class _FilledButtonTonalIconUseCase extends WidgetbookUseCase {
  _FilledButtonTonalIconUseCase()
      : super(
          name: 'FilledButton.tonalIcon',
          builder: (context) {
            return FilledButton.tonalIcon(
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
