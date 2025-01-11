import 'package:json_annotation/json_annotation.dart';
import 'error.dart';

part 'assign_orders_response.g.dart';

/// Response model for the assign orders operation
@JsonSerializable()
class AssignOrdersResponse {
  /// Determines whether the request was successfully submitted
  final bool success;

  /// List of detailed errors if the request was not successful
  final List<StarShipItError>? errors;

  /// Creates a new [AssignOrdersResponse] instance
  const AssignOrdersResponse({
    required this.success,
    this.errors,
  });

  /// Creates an [AssignOrdersResponse] from JSON data
  factory AssignOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$AssignOrdersResponseFromJson(json);

  /// Converts this [AssignOrdersResponse] into JSON data
  Map<String, dynamic> toJson() => _$AssignOrdersResponseToJson(this);
}
