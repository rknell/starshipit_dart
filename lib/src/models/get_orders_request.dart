import 'package:json_annotation/json_annotation.dart';
import 'filter.dart';
import 'sort_direction.dart';

part 'get_orders_request.g.dart';

/// The status of orders to filter by
enum OrderStatus {
  /// Unshipped orders
  @JsonValue('Unshipped')
  unshipped,

  /// Shipped orders
  @JsonValue('Shipped')
  shipped,
}

/// Additional objects and values to include in the response
enum OrderInclude {
  /// Include account summary
  @JsonValue('Account_Summary')
  accountSummary,

  /// Include shipment attributes
  @JsonValue('Shipment_Attributes')
  shipmentAttributes,

  /// Include sender details
  @JsonValue('Sender_Details')
  senderDetails,

  /// Include destination details
  @JsonValue('Destination')
  destination,

  /// Include order items
  @JsonValue('Items')
  items,

  /// Include packages
  @JsonValue('Packages')
  packages,

  /// Include metadata
  @JsonValue('Metadatas')
  metadatas,

  /// Include events
  @JsonValue('Events')
  events,

  /// Include shipping price
  @JsonValue('Shipping_Price')
  shippingPrice,
}

/// The field to sort orders by
enum OrderSortColumn {
  /// Sort by address
  @JsonValue('Address')
  address,get_order

  /// Sort by carrier
  @JsonValue('Carrier')
  carrier,

  /// Sort by name
  @JsonValue('Name')
  name,

  /// Sort by country
  @JsonValue('Country')
  country,

  /// Sort by order date
  @JsonValue('Date')
  date,

  /// Sort by items
  @JsonValue('Items')
  items,

  /// Sort by manifest number
  @JsonValue('Manifest')
  manifest,

  /// Sort by order number
  @JsonValue('Order')
  order,

  /// Sort by product
  @JsonValue('Product')
  product,

  /// Sort by quantity
  @JsonValue('Quantity')
  quantity,

  /// Sort by shipped date
  @JsonValue('ShippedDate')
  shippedDate,

  /// Sort by shipping description
  @JsonValue('ShippingDescription')
  shippingDescription,

  /// Sort by shipping method
  @JsonValue('ShippingMethod')
  shippingMethod,

  /// Sort by SKU
  @JsonValue('SKU')
  sku,

  /// Sort by stock on hand
  @JsonValue('StockOnHand')
  stockOnHand,

  /// Sort by platform
  @JsonValue('Platform')
  platform,

  /// Sort by state
  @JsonValue('State')
  state,

  /// Sort by status
  @JsonValue('Status')
  status,

  /// Sort by weight
  @JsonValue('Weight')
  weight,

  /// Sort by writeback status
  @JsonValue('Writeback')
  writeback,
}

/// Request Parameters for Get Orders:
/// ```
/// Parameter        Description                                     Example Value
/// order_id        The unique numeric identifier for the order     12345
/// order_number    The identifier from source e-Commerce platform  #1234
/// status          The order status to filter orders for           Unshipped
/// filter          See the Filters section                         Order:::#1234
/// include         Additional objects to include in response       Account_Summary
/// sort_column     Order field to sort by                         Address
/// sort_direction  Direction of the sort                          Ascending
/// page_number     Page number to return (default: 1)             1
/// page_size       Number of results per page (max: 500)          10
/// ```
@JsonSerializable()
class GetOrdersRequest {
  /// Creates a new get orders request instance
  GetOrdersRequest({
    this.orderId,
    this.orderNumber,
    this.status,
    this.filter,
    this.include,
    this.sortColumn,
    this.sortDirection,
    this.pageNumber,
    this.pageSize,
  }) : assert(
          pageSize == null || (pageSize >= 1 && pageSize <= 500),
          'page_size must be between 1 and 500',
        );

  /// The unique numeric identifier for the order
  @JsonKey(name: 'order_id')
  final int? orderId;

  /// The identifier of the order pulled from source e-Commerce platform
  @JsonKey(name: 'order_number')
  final String? orderNumber;

  /// The order status to filter orders for (default: unshipped)
  final OrderStatus? status;

  /// The filter string to apply (see Filters section)
  final Filter? filter;

  /// Additional objects and values to include in the response
  final List<OrderInclude>? include;

  /// The field to sort orders by
  @JsonKey(name: 'sort_column')
  final OrderSortColumn? sortColumn;

  /// The direction to sort orders in (default: Descending)
  @JsonKey(name: 'sort_direction')
  final SortDirection? sortDirection;

  /// The page number to return (default: 1)
  @JsonKey(name: 'page_number')
  final int? pageNumber;

  /// The number of results to return per page (default: 500, maximum: 500)
  @JsonKey(name: 'page_size')
  final int? pageSize;

  /// Creates a GetOrdersRequest from JSON
  factory GetOrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$GetOrdersRequestFromJson(json);

  /// Converts the GetOrdersRequest to JSON
  Map<String, dynamic> toJson() => _$GetOrdersRequestToJson(this);

  /// Converts the request parameters to query parameters
  Map<String, String> toQueryParameters() {
    final params = <String, String>{};

    if (orderId != null) {
      params['order_id'] = orderId.toString();
    }

    if (orderNumber != null) {
      params['order_number'] = orderNumber.toString();
    }

    if (status != null) {
      params['status'] = status.toString().split('.').last;
    }

    if (filter != null) {
      params['filter'] = filter.toString();
    }

    if (include != null && include!.isNotEmpty) {
      params['include'] =
          include!.map((e) => e.toString().split('.').last).join(',');
    }

    if (sortColumn != null) {
      params['sort_column'] = sortColumn.toString().split('.').last;
    }

    if (sortDirection != null) {
      params['sort_direction'] = sortDirection.toString().split('.').last;
    }

    if (pageNumber != null) {
      params['page_number'] = pageNumber.toString();
    }

    if (pageSize != null) {
      params['page_size'] = pageSize.toString();
    }

    return params;
  }
}
