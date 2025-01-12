import 'package:json_annotation/json_annotation.dart';

part 'full_order_item.g.dart';

/// API Field Structure:
/// ```
/// Attribute         Type      Description
/// item_id          integer   The unique numeric identifier for the order item
/// description      string    Product name or description
/// sku              string    Product code or SKU
/// tariff_code      string    The harmonized system code that indicates the type of this order item
/// country_of_origin string   The country in which this item was manufactured
/// quantity         integer   The number of product ordered
/// quantity_to_ship integer   The number of items to ship
/// weight           double    Unit weight of the product in kilograms (kg)
/// value            double    Unit price of the product
/// ```
@JsonSerializable()
class FullOrderItem {
  /// Creates a new full order item instance
  FullOrderItem({
    required this.itemId,
    required this.description,
    required this.sku,
    required this.tariffCode,
    required this.countryOfOrigin,
    required this.quantity,
    required this.quantityToShip,
    required this.weight,
    required this.value,
  });

  /// Creates a FullOrderItem from JSON
  factory FullOrderItem.fromJson(Map<String, dynamic> json) =>
      _$FullOrderItemFromJson(json);

  /// The unique numeric identifier for the order item
  @JsonKey(name: 'item_id')
  final int itemId;

  /// Product name or description
  final String description;

  /// Product code or SKU
  final String sku;

  /// The harmonized system code that indicates the type of this order item
  @JsonKey(name: 'tariff_code')
  final String tariffCode;

  /// The country in which this item was manufactured
  @JsonKey(name: 'country_of_origin')
  final String countryOfOrigin;

  /// The number of product ordered
  final int quantity;

  /// The number of items to ship
  @JsonKey(name: 'quantity_to_ship')
  final int quantityToShip;

  /// Unit weight of the product in kilograms (kg)
  final double weight;

  /// Unit price of the product
  final double value;

  /// Converts the FullOrderItem to JSON
  Map<String, dynamic> toJson() => _$FullOrderItemToJson(this);
}
