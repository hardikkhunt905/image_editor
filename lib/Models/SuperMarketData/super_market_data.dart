import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'super_market_data.freezed.dart';
part 'super_market_data.g.dart';

@freezed
class SuperMarketData with _$SuperMarketData {
  factory SuperMarketData({
    @JsonKey(name: "item_no")
    @Default("") String itemNo,
    @JsonKey(name: "colour")
    @Default("") String colour,
    @JsonKey(name: "type")
    @Default("") String type,
    @JsonKey(name: "superMarketStock")
    @Default(0) int superMarketStock,
  }) = _SuperMarketData;

  factory SuperMarketData.fromJson(Map<String, Object?> json)
  => _$SuperMarketDataFromJson(json);
}