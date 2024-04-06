import 'dart:collection';

import 'package:gallery/directories/custom/custom.dart';
import 'package:gallery/directories/material/material.dart';

final directories = UnmodifiableListView([
  MaterialFolder(),
  CustomFolder(),
]);
