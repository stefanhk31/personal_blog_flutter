import 'package:personal_blog_flutter/bootstrap.dart';

void main() {
  bootstrap(() => buildApp(const String.fromEnvironment('BASE_URL')));
}
