import 'package:json_annotation/json_annotation.dart';
import 'error.dart';

part 'merge_orders_response.g.dart';

/// Response model for the merge orders operation
@JsonSerializable()
class MergeOrdersResponse {
  /// Determines whether the request was successfully submitted
  final bool success;

  /// List of detailed errors if the request was not successful
  final List<StarShipItError>? errors;

  /// Creates a new [MergeOrdersResponse] instance
  const MergeOrdersResponse({
    required this.success,
    this.errors,
  });

  /// Creates a [MergeOrdersResponse] from JSON data
  factory MergeOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$MergeOrdersResponseFromJson(json);

  /// Converts this [MergeOrdersResponse] into JSON data
  Map<String, dynamic> toJson() => _$MergeOrdersResponseToJson(this);
}
