import 'package:aws_models/src/data_models/emails/content/content.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'simple_content.g.dart';

/// {@template simple_content}
/// Represents the content of an email message, composed of a subject, a body,
/// and a set of headers.
/// {@endtemplate}
@JsonSerializable()
class SimpleContent extends Equatable {
  /// {@macro simple_content}
  const SimpleContent({
    required this.body,
    required this.headers,
    required this.subject,
  });

  /// Factory constructor for creating a new `SimpleContent` instance
  factory SimpleContent.fromJson(Map<String, dynamic> json) =>
      _$SimpleContentFromJson(json);

  /// Serialize a `SimpleContent` instance to a map of JSON values.
  Map<String, dynamic> toJson() => _$SimpleContentToJson(this);

  /// The body of the message.
  /// You can specify an HTML version of the message,
  /// a text-only version of the message, or both.
  final SimpleBody body;

  /// The list of message headers
  /// that will be added to the email message.
  /// Maximum of 15.
  final List<Header> headers;

  /// The subject line of the email. The subject line
  /// can only contain 7-bit ASCII characters.
  /// However, you can specify non-ASCII characters in the subject line
  /// by using encoded-word syntax, as described
  /// in [RFC 2047](https://tools.ietf.org/html/rfc2047).
  final Subject subject;

  @override
  List<Object?> get props => [body, headers, subject];
}
