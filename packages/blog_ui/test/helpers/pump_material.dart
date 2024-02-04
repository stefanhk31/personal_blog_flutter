import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

extension WidgetPumps on WidgetTester {
  Future<void> pumpMaterial(Widget widget, {bool mockNetworkImages = false}) {
    final material = MaterialApp(
      home: Material(
        child: widget,
      ),
    );

    return mockNetworkImages
        ? mockNetworkImagesFor(
            () => pumpWidget(material),
          )
        : pumpWidget(material);
  }
}
