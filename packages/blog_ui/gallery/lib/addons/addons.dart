import 'dart:collection';

import 'package:blog_ui/blog_ui.dart';
import 'package:widgetbook/widgetbook.dart';

final addons = UnmodifiableListView<WidgetbookAddon>([
  AlignmentAddon(),
  AccessibilityAddon(),
  DeviceFrameAddon(
    devices: [
      Devices.ios.iPhoneSE,
      Devices.ios.iPhone13,
      Devices.macOS.macBookPro,
    ],
  ),
  MaterialThemeAddon(
    themes: [
      WidgetbookTheme(
        name: 'Light',
        data: BlogTheme.lightThemeData,
      ),
      WidgetbookTheme(
        name: 'Dark',
        data: BlogTheme.darkThemeData,
      ),
    ],
  ),
  TextScaleAddon(
    scales: [1.0, 2.0],
    initialScale: 1,
  ),
]);
