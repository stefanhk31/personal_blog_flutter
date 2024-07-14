import 'package:aws_models/src/data_models/emails/content/content.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'simple_body.g.dart';

/// {@template simple_body}
/// Represents the body of the email message. Can contain
/// either text, HTML, or both.
/// {@endtemplate}
@JsonSerializable()
class SimpleBody extends Equatable {
  /// {@macro simple_body}
  const SimpleBody({this.html, this.text});

  /// Create a `SimpleBody` with HTML and optional text.
  const SimpleBody.html({
    required this.html,
    this.text,
  });

  /// Create a `SimpleBody` with text and optional HTML.
  const SimpleBody.text({required this.text, this.html});

  /// Factory constructor for creating a new `SimpleBody` instance
  factory SimpleBody.fromJson(Map<String, dynamic> json) =>
      _$SimpleBodyFromJson(json);

  /// Serialize a `SimpleBody` instance to a map of JSON values.

  Map<String, dynamic> toJson() => _$SimpleBodyToJson(this);

  /// An object that represents the version of the message that is displayed
  /// in email clients that support HTML.
  /// HTML messages can include formatted text,
  ///  hyperlinks, images, and more.
  final HtmlContent? html;

  /// An object that represents the version of the message
  /// that is displayed in email clients that don't support HTML,
  /// or clients where the recipient has disabled HTML rendering.
  final TextContent? text;

  @override
  List<Object?> get props => [html, text];
}
