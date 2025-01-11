import 'package:json_annotation/json_annotation.dart';
import 'assign_order.dart';

part 'assign_orders_request.g.dart';

/// Request model for assigning orders between accounts
@JsonSerializable()
class AssignOrdersRequest {
  /// List of order assignments
  final List<AssignOrder> orders;

  /// Creates a new [AssignOrdersRequest] instance
  const AssignOrdersRequest({
    required this.orders,
  });

  /// Creates an [AssignOrdersRequest] from JSON data
  factory AssignOrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$AssignOrdersRequestFromJson(json);

  /// Converts this [AssignOrdersRequest] into JSON data
  Map<String, dynamic> toJson() => _$AssignOrdersRequestToJson(this);
}
