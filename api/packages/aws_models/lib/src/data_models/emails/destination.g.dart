// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
      toAddresses: (json['toAddresses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      ccAddresses: (json['ccAddresses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bccAddresses: (json['bccAddresses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'toAddresses': instance.toAddresses,
      'ccAddresses': instance.ccAddresses,
      'bccAddresses': instance.bccAddresses,
    };
