import 'package:gallery/directories/material/buttons/components/components.dart';
import 'package:widgetbook/widgetbook.dart';

class MaterialButtonsFolder extends WidgetbookFolder {
  MaterialButtonsFolder()
      : super(
          name: 'Buttons',
          children: [
            ElevatedButtonComponent(),
            FilledButtonComponent(),
            OutlinedButtonComponent(),
            TextButtonComponent(),
          ],
        );
}
