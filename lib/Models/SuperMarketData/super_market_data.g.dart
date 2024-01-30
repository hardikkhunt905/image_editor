// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'super_market_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuperMarketDataImpl _$$SuperMarketDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SuperMarketDataImpl(
      itemNo: json['item_no'] as String? ?? "",
      colour: json['colour'] as String? ?? "",
      type: json['type'] as String? ?? "",
      superMarketStock: json['superMarketStock'] as int? ?? 0,
    );

Map<String, dynamic> _$$SuperMarketDataImplToJson(
        _$SuperMarketDataImpl instance) =>
    <String, dynamic>{
      'item_no': instance.itemNo,
      'colour': instance.colour,
      'type': instance.type,
      'superMarketStock': instance.superMarketStock,
    };
