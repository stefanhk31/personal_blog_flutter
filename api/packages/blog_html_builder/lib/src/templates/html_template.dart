/// {@template HtmlTemplate}
/// An abstract class for generating HTML content to be delivered to the client.
/// {@endtemplate}
// ignore: one_member_abstracts
abstract class HtmlTemplate {
  /// {@macro HtmlTemplate}
  const HtmlTemplate();

  /// Generates the HTML content to be delivered to the client.
  String html();
}
