import 'package:json_annotation/json_annotation.dart';
import 'error.dart';
import 'mergeable_order_group.dart';

part 'get_mergeable_orders_response.g.dart';

/// Response model for getting a list of mergeable orders
@JsonSerializable()
class GetMergeableOrdersResponse {
  /// List of mergeable order groups
  final List<MergeableOrderGroup> orders;

  /// Total number of mergeable order groups
  final int total;

  /// Total number of pages available
  final int totalPages;

  /// Determines whether the request was successfully submitted
  final bool success;

  /// List of detailed errors if the request was not successful
  final List<StarShipItError>? errors;

  /// Creates a new [GetMergeableOrdersResponse] instance
  const GetMergeableOrdersResponse({
    required this.orders,
    required this.total,
    required this.totalPages,
    required this.success,
    this.errors,
  });

  /// Creates a [GetMergeableOrdersResponse] from JSON data
  factory GetMergeableOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMergeableOrdersResponseFromJson(json);

  /// Converts this [GetMergeableOrdersResponse] into JSON data
  Map<String, dynamic> toJson() => _$GetMergeableOrdersResponseToJson(this);
}
