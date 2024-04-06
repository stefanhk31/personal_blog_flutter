import 'package:gallery/directories/custom/components/components.dart';
import 'package:widgetbook/widgetbook.dart';

class CustomFolder extends WidgetbookFolder {
  CustomFolder()
      : super(
          name: 'Custom',
          children: [
            AuthorAvatarComponent(),
            AuthorTileComponent(),
            BlogCardComponent(),
            BlogDetailContentComponent(),
            FeaturedImageComponent(),
          ],
        );
}
