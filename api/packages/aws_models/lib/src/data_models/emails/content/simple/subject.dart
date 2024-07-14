import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject extends Equatable {
  Subject({required this.charset, required this.data});

  final String charset;
  final String data;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  @override
  List<Object?> get props => [charset, data];
}
