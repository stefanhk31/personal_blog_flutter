import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'destination.g.dart';

@JsonSerializable()
class Destination extends Equatable {
  /// {@macro destination}
  Destination({
    required this.toAddresses,
    this.ccAddresses,
    this.bccAddresses,
  });

  final List<String> toAddresses;
  final List<String>? ccAddresses;
  final List<String>? bccAddresses;

  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationToJson(this);

  @override
  List<Object?> get props => [toAddresses, ccAddresses, bccAddresses];
}
