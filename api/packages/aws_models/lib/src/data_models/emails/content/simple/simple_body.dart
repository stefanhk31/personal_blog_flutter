import 'package:equatable/equatable.dart';

import '../content.dart';
import 'package:json_annotation/json_annotation.dart';

part 'simple_body.g.dart';

@JsonSerializable()
class SimpleBody extends Equatable {
  SimpleBody({this.html, this.text});

  SimpleBody.html({
    required this.html,
    this.text,
  });

  SimpleBody.text({required this.text, this.html});

  final HtmlContent? html;
  final TextContent? text;

  factory SimpleBody.fromJson(Map<String, dynamic> json) =>
      _$SimpleBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleBodyToJson(this);

  @override
  List<Object?> get props => [html, text];
}
