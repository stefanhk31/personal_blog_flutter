import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncher {
  Future<bool> validateUrl({required String url}) async =>
      canLaunchUrlString(url);

  Future<void> launchUrl({required String url}) async =>
      launchUrlString(url, mode: LaunchMode.externalApplication);
}
