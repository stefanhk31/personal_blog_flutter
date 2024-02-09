import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Finder assetImageFinder(String assetName) => find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName == assetName,
    );
