import 'package:json_annotation/json_annotation.dart';

/// The status of shipments to return
enum ShipmentStatus {
  /// Orders that have been recently printed
  @JsonValue('recently_printed')
  recentlyPrinted,

  /// Orders that are unmanifested
  @JsonValue('unmanifested')
  unmanifested,
}

/// Request Parameters for List Shipments:
/// ```
/// Parameter            Description                                                     Example Value
/// since_created_date  Show shipments created after date in UTC (RFC3339)             2024-05-27T06:00:00.000Z
/// status              The status of the shipments to return                          recently_printed
/// limit               Amount of results (default: 50) (maximum: 250)                 50
/// page                Page to show (default: 1)                                      1
/// ```
class ListShipmentsRequest {
  /// Creates a new list shipments request instance
  ListShipmentsRequest({
    this.sinceCreatedDate,
    required this.status,
    this.limit = 50,
    this.page = 1,
  }) : assert(
          limit > 0 && limit <= 250,
          'limit must be between 1 and 250',
        );

  /// Show shipments created after date in UTC (RFC3339 format)
  final DateTime? sinceCreatedDate;

  /// The status of the shipments to return
  final ShipmentStatus status;

  /// Amount of results (default: 50) (maximum: 250)
  final int limit;

  /// Page to show (default: 1)
  final int page;

  /// Converts the request parameters to query parameters
  Map<String, String> toQueryParameters() {
    final params = <String, String>{};

    if (sinceCreatedDate != null) {
      params['since_created_date'] =
          sinceCreatedDate!.toUtc().toIso8601String();
    }

    params['status'] = status.toString().split('.').last;
    params['limit'] = limit.toString();
    params['page'] = page.toString();

    return params;
  }
}
