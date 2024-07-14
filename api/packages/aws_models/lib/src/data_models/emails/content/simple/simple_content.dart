import 'package:equatable/equatable.dart';

import '../content.dart';
import 'package:json_annotation/json_annotation.dart';

part 'simple_content.g.dart';

@JsonSerializable()
class SimpleContent extends Equatable {
  SimpleContent({
    required this.body,
    required this.headers,
    required this.subject,
  });

  final SimpleBody body;
  final List<Header> headers;
  final Subject subject;

  factory SimpleContent.fromJson(Map<String, dynamic> json) =>
      _$SimpleContentFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleContentToJson(this);

  @override
  List<Object?> get props => [body, headers, subject];
}
