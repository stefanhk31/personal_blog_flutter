import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Destination {
  /// {@macro destination}
  Destination({
    required this.toAddresses,
    this.ccAddresses,
    this.bccAddresses,
  });

  final List<String> toAddresses;
  final List<String>? ccAddresses;
  final List<String>? bccAddresses;
}
