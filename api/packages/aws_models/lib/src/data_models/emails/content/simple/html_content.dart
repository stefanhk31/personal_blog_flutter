import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'html_content.g.dart';

@JsonSerializable()
class HtmlContent extends Equatable {
  HtmlContent({required this.charset, required this.data});

  final String charset;
  final String data;

  factory HtmlContent.fromJson(Map<String, dynamic> json) =>
      _$HtmlContentFromJson(json);

  Map<String, dynamic> toJson() => _$HtmlContentToJson(this);

  @override
  List<Object?> get props => [charset, data];
}
