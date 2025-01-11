import 'package:json_annotation/json_annotation.dart';

part 'update_order_item.g.dart';

/// Represents an item in an update order request for the StarShipIT API
@JsonSerializable()
class UpdateOrderItem {
  /// Creates a new update order item instance
  UpdateOrderItem({
    required this.itemId,
    required this.description,
    required this.sku,
    required this.tariffCode,
    required this.countryOfOrigin,
    required this.quantity,
    required this.quantityToShip,
    required this.weight,
    required this.value,
    required this.delete,
    required this.color,
    required this.size,
    required this.barcode,
    required this.stockOnHand,
  })  : assert(sku.length <= 50, 'sku must not exceed 50 characters'),
        assert(tariffCode.length <= 18,
            'tariff_code must not exceed 18 characters'),
        assert(countryOfOrigin.length <= 50,
            'country_of_origin must not exceed 50 characters');

  /// The unique numeric identifier for the order item
  @JsonKey(name: 'item_id')
  final int itemId;

  /// Product name or description
  final String description;

  /// Product code or SKU (max length: 50)
  final String sku;

  /// The harmonized system code that indicates the type of this order item (max length: 18)
  @JsonKey(name: 'tariff_code')
  final String tariffCode;

  /// The country in which this item was manufactured (max length: 50)
  @JsonKey(name: 'country_of_origin')
  final String countryOfOrigin;

  /// The number of product ordered
  final double quantity;

  /// The number of items to ship
  @JsonKey(name: 'quantity_to_ship')
  final double quantityToShip;

  /// Unit weight of the product in kilograms (kg)
  final double weight;

  /// Unit price of the product
  final double value;

  /// An indicator used to determine whether this order item should be deleted when updating the order
  final bool delete;

  /// The colour of the item
  final String color;

  /// The size of the item
  final String size;

  /// The barcode of the item, used for packing validation and printed on the packing slips
  final String barcode;

  /// The count of stock for that item, used on packing slips
  @JsonKey(name: 'stock_on_hand')
  final int stockOnHand;

  /// Creates an UpdateOrderItem from JSON
  factory UpdateOrderItem.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderItemFromJson(json);

  /// Converts the UpdateOrderItem to JSON
  Map<String, dynamic> toJson() => _$UpdateOrderItemToJson(this);
}
