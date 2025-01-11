import 'package:json_annotation/json_annotation.dart';
import 'error.dart';
import 'search_order.dart';

part 'search_orders_response.g.dart';

/// Response from the search orders endpoint
@JsonSerializable()
class SearchOrdersResponse {
  /// Creates a new search orders response
  SearchOrdersResponse({
    required this.orders,
    required this.totalPages,
    required this.success,
    this.errors,
  });

  /// List of orders matching the search criteria
  final List<SearchOrder> orders;

  /// Total number of pages available
  @JsonKey(name: 'total_pages')
  final int totalPages;

  /// Whether the request was successful
  final bool success;

  /// List of errors if the request failed
  final List<StarShipItError>? errors;

  /// Creates a SearchOrdersResponse from JSON
  factory SearchOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchOrdersResponseFromJson(json);

  /// Converts the SearchOrdersResponse to JSON
  Map<String, dynamic> toJson() => _$SearchOrdersResponseToJson(this);
}
