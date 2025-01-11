import 'package:json_annotation/json_annotation.dart';
import 'filter.dart';

/// The status of orders to show in the summary
enum OrderSummaryStatus {
  /// New orders
  @JsonValue('new')
  newOrders,

  /// Shipped orders
  @JsonValue('shipped')
  shipped,

  /// Printed orders
  @JsonValue('printed')
  printed,

  /// Archived orders
  @JsonValue('archived')
  archived,
}

/// The field to sort orders by
enum OrderSortField {
  /// Sort by address
  @JsonValue('Address')
  address,

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

  /// Sort by order status
  @JsonValue('Status')
  status,

  /// Sort by weight
  @JsonValue('Weight')
  weight,

  /// Sort by writeback status
  @JsonValue('Writeback')
  writeback,
}

/// The direction to sort orders in
enum SortDirection {
  /// Sort in ascending order
  @JsonValue('Ascending')
  ascending,

  /// Sort in descending order
  @JsonValue('Descending')
  descending,
}

/// Request Parameters for List Orders Summary:
/// ```
/// Parameter      Description                                     Example Value
/// order_status   order status to show order summary of          shipped
/// page           page number                                    1
/// page_size      number of results to return                    500
/// filter         filter string (see Filters section)            Order:::1419
/// sort           Order field to sort by                         Order
/// sort_direction Sort Direction                                 Ascending
/// ```
class ListOrdersSummaryRequest {
  /// Creates a new list orders summary request instance
  ListOrdersSummaryRequest({
    required this.orderStatus,
    this.page,
    this.pageSize,
    this.filter,
    this.sort,
    this.sortDirection,
  }) : assert(
          pageSize == null || (pageSize >= 1 && pageSize <= 500),
          'page_size must be between 1 and 500',
        );

  /// The status of orders to show in the summary
  final OrderSummaryStatus orderStatus;

  /// The page number (1-based)
  final int? page;

  /// The number of results to return per page (max: 500)
  final int? pageSize;

  /// The filter string to apply (see Filters section)
  final Filter? filter;

  /// The field to sort orders by
  final OrderSortField? sort;

  /// The direction to sort orders in
  final SortDirection? sortDirection;

  /// Converts the request parameters to query parameters
  Map<String, String> toQueryParameters() {
    final params = <String, String>{
      'order_status': orderStatus.name,
    };

    if (page != null) {
      params['page'] = page.toString();
    }

    if (pageSize != null) {
      params['page_size'] = pageSize.toString();
    }

    if (filter != null) {
      params['filter'] = filter.toString();
    }

    if (sort != null) {
      params['sort'] = sort.toString();
    }

    if (sortDirection != null) {
      params['sort_direction'] = sortDirection.toString();
    }

    return params;
  }
}
