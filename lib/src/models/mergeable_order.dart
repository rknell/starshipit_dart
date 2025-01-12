import 'package:json_annotation/json_annotation.dart';

part 'mergeable_order.g.dart';

/// Represents a single order that can be merged with others
@JsonSerializable()
class MergeableOrder {

  /// Creates a new [MergeableOrder] instance
  const MergeableOrder({
    required this.orderId,
    required this.orderNumber,
    required this.orderDate,
    required this.street,
    this.suburb,
    required this.city,
    required this.postcode,
    this.state,
    required this.country,
    required this.contact,
  });

  /// Creates a [MergeableOrder] from JSON data
  factory MergeableOrder.fromJson(Map<String, dynamic> json) =>
      _$MergeableOrderFromJson(json);
  /// The Starshipit order ID
  final int orderId;

  /// The order number from the source system
  final String orderNumber;

  /// The date the order was created
  final DateTime orderDate;

  /// The street address for delivery
  final String street;

  /// The suburb for delivery (optional)
  final String? suburb;

  /// The city for delivery
  final String city;

  /// The postal code for delivery
  final String postcode;

  /// The state/province for delivery (optional)
  final String? state;

  /// The country for delivery
  final String country;

  /// The contact person for delivery
  final String contact;

  /// Converts this [MergeableOrder] into JSON data
  Map<String, dynamic> toJson() => _$MergeableOrderToJson(this);
}
