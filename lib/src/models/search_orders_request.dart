import 'package:json_annotation/json_annotation.dart';

/// Specifies which fields to search in when searching orders
enum SearchField {
  /// Search across all fields (order number, tracking number, theirRef, name)
  @JsonValue('All')
  all,

  /// Search only order numbers
  @JsonValue('Order_Number')
  orderNumber,

  /// Search only reference numbers
  @JsonValue('TheirRef')
  theirRef,
}

/// Specifies the order status to filter by when searching orders
enum SearchOrderStatus {
  /// Include orders with any status
  @JsonValue('All')
  all,

  /// Include only unshipped orders
  @JsonValue('Unshipped')
  unshipped,

  /// Include only shipped orders
  @JsonValue('Shipped')
  shipped,
}

/// Request parameters for searching orders
class SearchOrdersRequest {
  /// Creates a new search orders request
  ///
  /// [limit] must be between 1 and 250 if provided
  SearchOrdersRequest({
    this.phrase,
    this.limit = 50,
    this.page = 1,
    this.status = SearchOrderStatus.all,
    this.fields = SearchField.all,
    this.includeChildAccounts = false,
  }) : assert(
          limit == null || (limit >= 1 && limit <= 250),
          'limit must be between 1 and 250',
        );

  /// The search phrase to look for
  final String? phrase;

  /// Amount of results per page (default: 50, max: 250)
  final int? limit;

  /// Page number to return (default: 1)
  final int? page;

  /// Filter orders by status (default: All)
  final SearchOrderStatus? status;

  /// Which fields to search in (default: All)
  final SearchField? fields;

  /// Whether to include orders from child accounts (default: false)
  final bool? includeChildAccounts;

  /// Converts the request parameters to query parameters for the API call
  Map<String, String> toQueryParameters() {
    final params = <String, String>{};

    if (phrase != null) params['phrase'] = phrase!;
    if (limit != null) params['limit'] = limit.toString();
    if (page != null) params['page'] = page.toString();
    if (status != null) params['status'] = status.toString().split('.').last;
    if (fields != null) params['fields'] = fields.toString().split('.').last;
    if (includeChildAccounts != null) {
      params['include_child_accounts'] = includeChildAccounts.toString();
    }

    return params;
  }
}
