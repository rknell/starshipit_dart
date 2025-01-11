import 'package:json_annotation/json_annotation.dart';

import 'error.dart';

part 'list_orders_summary_response.g.dart';

/// A summary of an order in the StarShipIT API
@JsonSerializable()
class OrderSummary {
  /// Creates a new order summary instance
  OrderSummary({
    required this.orderId,
    required this.orderNumber,
    required this.contactName,
    required this.country,
    required this.state,
    required this.orderType,
    required this.platform,
    required this.integrationId,
    required this.orderStatus,
    required this.carrier,
    required this.product,
    required this.weight,
    required this.weightUnit,
    required this.validAddress,
    required this.quantity,
    required this.skus,
    required this.items,
    required this.soh,
    required this.manifestNumber,
    required this.manifestSent,
    required this.writebackStatus,
    required this.orderDate,
    required this.shippedDate,
  });

  /// The unique numeric identifier for the order
  @JsonKey(name: 'order_id')
  final int orderId;

  /// The order number from the source platform
  @JsonKey(name: 'order_number')
  final String orderNumber;

  /// The name of the contact person for the order
  @JsonKey(name: 'contact_name')
  final String contactName;

  /// The country of the shipping address
  final String country;

  /// The state/province of the shipping address
  final String state;

  /// The type of order (e.g., "Outgoing")
  @JsonKey(name: 'order_type')
  final String orderType;

  /// The source platform (e.g., "WooCommerce")
  final String platform;

  /// The integration ID
  @JsonKey(name: 'integration_id')
  final int integrationId;

  /// The status code of the order
  @JsonKey(name: 'order_status')
  final int orderStatus;

  /// The carrier used for shipping
  final String carrier;

  /// The product code
  final String product;

  /// The weight of the order
  final double weight;

  /// The unit of weight measurement (e.g., "kg")
  @JsonKey(name: 'weight_unit')
  final String weightUnit;

  /// Whether the shipping address is valid
  @JsonKey(name: 'valid_address')
  final bool validAddress;

  /// The quantity information
  final String quantity;

  /// The SKUs in the order
  final String skus;

  /// The items in the order
  final String items;

  /// The stock on hand information
  final String soh;

  /// The manifest number
  @JsonKey(name: 'manifest_number')
  final int manifestNumber;

  /// Whether the manifest has been sent
  @JsonKey(name: 'manifest_sent')
  final bool manifestSent;

  /// The writeback status
  @JsonKey(name: 'writeback_status')
  final String writebackStatus;

  /// The date when the order was created
  @JsonKey(name: 'order_date')
  final DateTime orderDate;

  /// The date when the order was shipped
  @JsonKey(name: 'shipped_date')
  final DateTime shippedDate;

  /// Creates an OrderSummary from JSON
  factory OrderSummary.fromJson(Map<String, dynamic> json) =>
      _$OrderSummaryFromJson(json);

  /// Converts the OrderSummary to JSON
  Map<String, dynamic> toJson() => _$OrderSummaryToJson(this);
}

/// Statistics about order counts by status
@JsonSerializable()
class OrderCounts {
  /// Creates a new order counts instance
  OrderCounts({
    required this.unprintedCount,
    required this.printedCount,
    required this.shippedCount,
    required this.archivedCount,
    required this.archivedUnshippedCount,
    required this.archivedShippedCount,
    required this.unprintedInvalidaddressCount,
    required this.returnCount,
  });

  /// Number of unprinted orders
  @JsonKey(name: 'unprinted_count')
  final int unprintedCount;

  /// Number of printed orders
  @JsonKey(name: 'printed_count')
  final int printedCount;

  /// Number of shipped orders
  @JsonKey(name: 'shipped_count')
  final int shippedCount;

  /// Number of archived orders
  @JsonKey(name: 'archived_count')
  final int archivedCount;

  /// Number of archived unshipped orders
  @JsonKey(name: 'archived_unshipped_count')
  final int archivedUnshippedCount;

  /// Number of archived shipped orders
  @JsonKey(name: 'archived_shipped_count')
  final int archivedShippedCount;

  /// Number of unprinted orders with invalid addresses
  @JsonKey(name: 'unprinted_invalidaddress_count')
  final int unprintedInvalidaddressCount;

  /// Number of return orders
  @JsonKey(name: 'return_count')
  final int returnCount;

  /// Creates an OrderCounts from JSON
  factory OrderCounts.fromJson(Map<String, dynamic> json) =>
      _$OrderCountsFromJson(json);

  /// Converts the OrderCounts to JSON
  Map<String, dynamic> toJson() => _$OrderCountsToJson(this);
}

/// Response from the List Orders Summary endpoint
@JsonSerializable()
class ListOrdersSummaryResponse {
  /// Creates a new list orders summary response instance
  ListOrdersSummaryResponse({
    required this.orders,
    required this.orderCounts,
    required this.success,
    this.errors,
  });

  /// List of order summaries
  final List<OrderSummary> orders;

  /// Statistics about order counts by status
  @JsonKey(name: 'order_counts')
  final OrderCounts orderCounts;

  /// Whether the request was successful
  final bool success;

  /// List of errors if the request failed
  final List<StarShipItError>? errors;

  /// Creates a ListOrdersSummaryResponse from JSON
  factory ListOrdersSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOrdersSummaryResponseFromJson(json);

  /// Converts the ListOrdersSummaryResponse to JSON
  Map<String, dynamic> toJson() => _$ListOrdersSummaryResponseToJson(this);
}
