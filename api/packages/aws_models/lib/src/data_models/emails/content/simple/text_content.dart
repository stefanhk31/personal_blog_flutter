import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'text_content.g.dart';

@JsonSerializable()
class TextContent extends Equatable {
  TextContent({required this.charset, required this.data});

  final String charset;
  final String data;

  factory TextContent.fromJson(Map<String, dynamic> json) =>
      _$TextContentFromJson(json);

  Map<String, dynamic> toJson() => _$TextContentToJson(this);

  @override
  List<Object?> get props => [charset, data];
}
