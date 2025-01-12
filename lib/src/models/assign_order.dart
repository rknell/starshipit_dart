import 'package:json_annotation/json_annotation.dart';

part 'assign_order.g.dart';

/// Model for assigning an order from one account to another
@JsonSerializable()
class AssignOrder {

  /// Creates a new [AssignOrder] instance
  const AssignOrder({
    this.orderId,
    this.orderNumber,
    required this.currentApiKey,
    required this.newApiKey,
  }) : assert(
          orderId != null || orderNumber != null,
          'Either orderId or orderNumber must be provided',
        );

  /// Creates an [AssignOrder] from JSON data
  factory AssignOrder.fromJson(Map<String, dynamic> json) =>
      _$AssignOrderFromJson(json);
  /// The unique numeric identifier for the order (optional)
  final int? orderId;

  /// The identifier of the order pulled from source e-Commerce platform (optional)
  final String? orderNumber;

  /// The api key of the account that the order currently resides in
  final String currentApiKey;

  /// The api key of the account that you wish to assign the order to
  final String newApiKey;

  /// Converts this [AssignOrder] into JSON data
  Map<String, dynamic> toJson() => _$AssignOrderToJson(this);
}
