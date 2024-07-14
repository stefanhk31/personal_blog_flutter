import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'header.g.dart';

/// {@template header}
/// Contains the name and value of a message header
/// that you add to an email.
/// {@endtemplate}
@JsonSerializable()
class Header extends Equatable {
  /// {@macro header}
  const Header({required this.name, required this.value});

  /// Factory constructor for creating a new `Header` instance
  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

  /// Serialize a `Header` instance to a map of JSON values.
  Map<String, dynamic> toJson() => _$HeaderToJson(this);

  /// The name of the header. The header name can only
  /// contain ASCII letters (a–z, A–Z), numbers (0–9),
  /// underscores (_), or dashes (-), and must contain no more
  /// than 256 characters.
  final String name;

  /// The value of the header. The header value can only
  /// contain ASCII letters (a–z, A–Z), numbers (0–9),
  /// underscores (_), or dashes (-), and must contain no more
  /// than 256 characters.
  final String value;

  @override
  List<Object?> get props => [name, value];
}
