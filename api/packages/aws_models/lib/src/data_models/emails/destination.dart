import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'destination.g.dart';

/// {@template destination}
/// An object that describes the recipients for an email.
/// {@endtemplate}
@JsonSerializable()
class Destination extends Equatable {
  /// {@macro destination}
  const Destination({
    required this.toAddresses,
    this.ccAddresses,
    this.bccAddresses,
  });

  /// Factory constructor for creating a new `Destination` instance
  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);

  /// Serialize a `Destination` instance to a map of JSON values.
  Map<String, dynamic> toJson() => _$DestinationToJson(this);

  /// An array that contains the email addresses
  /// of the "To" recipients for the email.
  final List<String> toAddresses;

  /// An array that contains the email addresses
  /// of the "CC" (carbon copy) recipients for the email.
  final List<String>? ccAddresses;

  /// An array that contains the email addresses
  /// of the "BCC" (blind carbon copy) recipients for the email.
  final List<String>? bccAddresses;

  @override
  List<Object?> get props => [toAddresses, ccAddresses, bccAddresses];
}
