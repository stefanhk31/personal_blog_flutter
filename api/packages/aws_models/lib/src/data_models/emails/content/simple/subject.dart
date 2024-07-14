import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

/// {@template subject}
/// The subject line of the email.
/// The subject line can only contain 7-bit ASCII characters.
/// However, you can specify non-ASCII characters in the subject line
/// by using encoded-word syntax, as described
/// in [RFC 2047](https://tools.ietf.org/html/rfc2047).
/// {@endtemplate}
@JsonSerializable()
class Subject extends Equatable {
  /// {@macro subject}
  const Subject({required this.data, this.charset});

  /// Factory constructor for creating a new `Subject` instance
  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  /// Serialize a `Subject` instance to a map of JSON values.
  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  /// The content of the subject itself.
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
