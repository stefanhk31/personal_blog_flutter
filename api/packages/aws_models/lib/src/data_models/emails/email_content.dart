import 'package:equatable/equatable.dart';

import 'content/content.dart';
import 'package:json_annotation/json_annotation.dart';

part 'email_content.g.dart';

@JsonSerializable()
class EmailContent extends Equatable {
  EmailContent({required this.simple});

  final SimpleContent simple;

  factory EmailContent.fromJson(Map<String, dynamic> json) =>
      _$EmailContentFromJson(json);

  Map<String, dynamic> toJson() => _$EmailContentToJson(this);

  @override
  List<Object?> get props => [simple];
}
