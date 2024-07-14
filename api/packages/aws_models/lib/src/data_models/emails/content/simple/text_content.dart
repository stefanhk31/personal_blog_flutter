import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'text_content.g.dart';

/// {@template text_content}
/// Represents the content of an email message in text format.
/// {@endtemplate}
@JsonSerializable()
class TextContent extends Equatable {
  /// {@macro text_content}
  const TextContent({required this.data, this.charset});

  /// Factory constructor for creating a [TextContent] instance
  /// from a JSON object
  factory TextContent.fromJson(Map<String, dynamic> json) =>
      _$TextContentFromJson(json);

  /// Serialize a [TextContent] instance to a JSON object
  Map<String, dynamic> toJson() => _$TextContentToJson(this);

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
