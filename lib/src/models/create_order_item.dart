import 'package:json_annotation/json_annotation.dart';

part 'create_order_item.g.dart';

/// Represents an item in a create order request for the StarShipIT API
@JsonSerializable()
class CreateOrderItem {
  /// Creates a new create order item instance
  CreateOrderItem({
    this.description,
    this.sku,
    this.tariffCode,
    this.countryOfOrigin,
    this.quantity,
    this.weight,
    this.value,
  })  : assert(sku == null || sku.length <= 50,
            'sku must not exceed 50 characters'),
        assert(tariffCode == null || tariffCode.length <= 18,
            'tariff_code must not exceed 18 characters'),
        assert(countryOfOrigin == null || countryOfOrigin.length <= 50,
            'country_of_origin must not exceed 50 characters');

  /// Product name or description
  final String? description;

  /// Product code or SKU (max length: 50)
  final String? sku;

  /// The harmonized system code that indicates the type of this order item (max length: 18)
  @JsonKey(name: 'tariff_code')
  final String? tariffCode;

  /// The country in which this item was manufactured (max length: 50)
  @JsonKey(name: 'country_of_origin')
  final String? countryOfOrigin;

  /// The number of product ordered
  final double? quantity;

  /// Unit weight of the product in kilograms (kg)
  final double? weight;

  /// Unit price of the product
  final double? value;

  /// Creates a CreateOrderItem from JSON
  factory CreateOrderItem.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderItemFromJson(json);

  /// Converts the CreateOrderItem to JSON
  Map<String, dynamic> toJson() => _$CreateOrderItemToJson(this);
}
