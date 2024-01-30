// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'super_market_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SuperMarketData _$SuperMarketDataFromJson(Map<String, dynamic> json) {
  return _SuperMarketData.fromJson(json);
}

/// @nodoc
mixin _$SuperMarketData {
  @JsonKey(name: "item_no")
  String get itemNo => throw _privateConstructorUsedError;
  @JsonKey(name: "colour")
  String get colour => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "superMarketStock")
  int get superMarketStock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuperMarketDataCopyWith<SuperMarketData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuperMarketDataCopyWith<$Res> {
  factory $SuperMarketDataCopyWith(
          SuperMarketData value, $Res Function(SuperMarketData) then) =
      _$SuperMarketDataCopyWithImpl<$Res, SuperMarketData>;
  @useResult
  $Res call(
      {@JsonKey(name: "item_no") String itemNo,
      @JsonKey(name: "colour") String colour,
      @JsonKey(name: "type") String type,
      @JsonKey(name: "superMarketStock") int superMarketStock});
}

/// @nodoc
class _$SuperMarketDataCopyWithImpl<$Res, $Val extends SuperMarketData>
    implements $SuperMarketDataCopyWith<$Res> {
  _$SuperMarketDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemNo = null,
    Object? colour = null,
    Object? type = null,
    Object? superMarketStock = null,
  }) {
    return _then(_value.copyWith(
      itemNo: null == itemNo
          ? _value.itemNo
          : itemNo // ignore: cast_nullable_to_non_nullable
              as String,
      colour: null == colour
          ? _value.colour
          : colour // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      superMarketStock: null == superMarketStock
          ? _value.superMarketStock
          : superMarketStock // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuperMarketDataImplCopyWith<$Res>
    implements $SuperMarketDataCopyWith<$Res> {
  factory _$$SuperMarketDataImplCopyWith(_$SuperMarketDataImpl value,
          $Res Function(_$SuperMarketDataImpl) then) =
      __$$SuperMarketDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "item_no") String itemNo,
      @JsonKey(name: "colour") String colour,
      @JsonKey(name: "type") String type,
      @JsonKey(name: "superMarketStock") int superMarketStock});
}

/// @nodoc
class __$$SuperMarketDataImplCopyWithImpl<$Res>
    extends _$SuperMarketDataCopyWithImpl<$Res, _$SuperMarketDataImpl>
    implements _$$SuperMarketDataImplCopyWith<$Res> {
  __$$SuperMarketDataImplCopyWithImpl(
      _$SuperMarketDataImpl _value, $Res Function(_$SuperMarketDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemNo = null,
    Object? colour = null,
    Object? type = null,
    Object? superMarketStock = null,
  }) {
    return _then(_$SuperMarketDataImpl(
      itemNo: null == itemNo
          ? _value.itemNo
          : itemNo // ignore: cast_nullable_to_non_nullable
              as String,
      colour: null == colour
          ? _value.colour
          : colour // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      superMarketStock: null == superMarketStock
          ? _value.superMarketStock
          : superMarketStock // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuperMarketDataImpl
    with DiagnosticableTreeMixin
    implements _SuperMarketData {
  _$SuperMarketDataImpl(
      {@JsonKey(name: "item_no") this.itemNo = "",
      @JsonKey(name: "colour") this.colour = "",
      @JsonKey(name: "type") this.type = "",
      @JsonKey(name: "superMarketStock") this.superMarketStock = 0});

  factory _$SuperMarketDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuperMarketDataImplFromJson(json);

  @override
  @JsonKey(name: "item_no")
  final String itemNo;
  @override
  @JsonKey(name: "colour")
  final String colour;
  @override
  @JsonKey(name: "type")
  final String type;
  @override
  @JsonKey(name: "superMarketStock")
  final int superMarketStock;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SuperMarketData(itemNo: $itemNo, colour: $colour, type: $type, superMarketStock: $superMarketStock)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SuperMarketData'))
      ..add(DiagnosticsProperty('itemNo', itemNo))
      ..add(DiagnosticsProperty('colour', colour))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('superMarketStock', superMarketStock));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuperMarketDataImpl &&
            (identical(other.itemNo, itemNo) || other.itemNo == itemNo) &&
            (identical(other.colour, colour) || other.colour == colour) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.superMarketStock, superMarketStock) ||
                other.superMarketStock == superMarketStock));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, itemNo, colour, type, superMarketStock);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuperMarketDataImplCopyWith<_$SuperMarketDataImpl> get copyWith =>
      __$$SuperMarketDataImplCopyWithImpl<_$SuperMarketDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuperMarketDataImplToJson(
      this,
    );
  }
}

abstract class _SuperMarketData implements SuperMarketData {
  factory _SuperMarketData(
          {@JsonKey(name: "item_no") final String itemNo,
          @JsonKey(name: "colour") final String colour,
          @JsonKey(name: "type") final String type,
          @JsonKey(name: "superMarketStock") final int superMarketStock}) =
      _$SuperMarketDataImpl;

  factory _SuperMarketData.fromJson(Map<String, dynamic> json) =
      _$SuperMarketDataImpl.fromJson;

  @override
  @JsonKey(name: "item_no")
  String get itemNo;
  @override
  @JsonKey(name: "colour")
  String get colour;
  @override
  @JsonKey(name: "type")
  String get type;
  @override
  @JsonKey(name: "superMarketStock")
  int get superMarketStock;
  @override
  @JsonKey(ignore: true)
  _$$SuperMarketDataImplCopyWith<_$SuperMarketDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
