import 'package:json_annotation/json_annotation.dart';

/// Request Parameters for List Unshipped Orders:
/// ```
/// Parameter            Description                                                     Example Value
/// since_order_date    Show orders created after date in UTC (RFC3339)                2024-05-27T06:00:00.000Z
/// since_last_updated  Show orders recently updated after date in UTC (RFC3339)       2024-05-27T06:00:00.000Z
/// ids_only           Show all unshipped order_ids                                    false
/// limit              Amount of results (default: 50) (maximum: 250)                  50
/// page               Page to show (default: 1)                                       1
/// ```
class ListUnshippedOrdersRequest {
  /// Creates a new list unshipped orders request instance
  ListUnshippedOrdersRequest({
    this.sinceOrderDate,
    this.sinceLastUpdated,
    this.idsOnly = false,
    this.limit = 50,
    this.page = 1,
  }) : assert(
          limit > 0 && limit <= 250,
          'limit must be between 1 and 250',
        );

  /// Show orders created after date in UTC (RFC3339 format)
  final DateTime? sinceOrderDate;

  /// Show orders recently updated after date in UTC (RFC3339 format)
  final DateTime? sinceLastUpdated;

  /// Show all unshipped order_ids only
  final bool idsOnly;

  /// Amount of results (default: 50) (maximum: 250)
  final int limit;

  /// Page to show (default: 1)
  final int page;

  /// Converts the request parameters to query parameters
  Map<String, String> toQueryParameters() {
    final params = <String, String>{};

    if (sinceOrderDate != null) {
      params['since_order_date'] = sinceOrderDate!.toUtc().toIso8601String();
    }

    if (sinceLastUpdated != null) {
      params['since_last_updated'] =
          sinceLastUpdated!.toUtc().toIso8601String();
    }

    params['ids_only'] = idsOnly.toString().toLowerCase();
    params['limit'] = limit.toString();
    params['page'] = page.toString();

    return params;
  }
}
