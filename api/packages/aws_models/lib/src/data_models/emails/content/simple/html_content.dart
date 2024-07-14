import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'html_content.g.dart';

/// {@template html_content}
/// Represents the content of an email message in HTML format.
/// {@endtemplate}
@JsonSerializable()
class HtmlContent extends Equatable {
  /// {@macro html_content}
  const HtmlContent({required this.data, this.charset});

  /// Factory constructor for creating a new `HtmlContent` instance
  factory HtmlContent.fromJson(Map<String, dynamic> json) =>
      _$HtmlContentFromJson(json);

  /// Serialize a `HtmlContent` instance to a map of JSON values.
  Map<String, dynamic> toJson() => _$HtmlContentToJson(this);

  /// The content of the message itself.
  final String data;

  /// The character set for the content. Because of the constraints
  /// of the SMTP protocol, Amazon SES uses 7-bit ASCII by default.
  /// If the text includes characters outside of the ASCII range,
  /// you have to specify a character set.
  ///
  /// For example, you could specify UTF-8, ISO-8859-1, or Shift_JIS.
  final String? charset;

  @override
  List<Object?> get props => [charset, data];
}
