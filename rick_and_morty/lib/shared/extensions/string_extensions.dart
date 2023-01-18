import 'package:url_launcher/url_launcher.dart';

extension StringExtensions on String {
  Future<void> launchInBrowser() async {
    final uri = Uri(scheme: 'https', host: this);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $uri';
    }
  }
}
