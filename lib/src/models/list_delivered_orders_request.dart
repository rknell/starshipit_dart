import 'package:json_annotation/json_annotation.dart';

/// Request Parameters for List Delivered Orders:
/// ```
/// Parameter   Description                                          Example Value
/// order_ref   The order reference to filter delivered orders by    12345
/// ```
class ListDeliveredOrdersRequest {
  /// Creates a new list delivered orders request instance
  ListDeliveredOrdersRequest({
    required this.orderRef,
  });

  /// The order reference to filter delivered orders by
  final String orderRef;

  /// Converts the request parameters to query parameters
  Map<String, String> toQueryParameters() {
    return {
      'order_ref': orderRef,
    };
  }
}
