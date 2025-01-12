import 'package:json_annotation/json_annotation.dart';

part 'merge_orders_request.g.dart';

/// Request model for merging multiple unshipped orders into a single unshipped order
@JsonSerializable()
class MergeOrdersRequest {

  /// Creates a new [MergeOrdersRequest] instance
  const MergeOrdersRequest({
    required this.parentOrderId,
    required this.childOrderIds,
  });

  /// Creates a [MergeOrdersRequest] from JSON data
  factory MergeOrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$MergeOrdersRequestFromJson(json);
  /// The order_id of the unshipped order for the child orders to merge under
  final int parentOrderId;

  /// List of order_id to merge into the parent unshipped order
  final List<int> childOrderIds;

  /// Converts this [MergeOrdersRequest] into JSON data
  Map<String, dynamic> toJson() => _$MergeOrdersRequestToJson(this);
}
