import 'package:json_annotation/json_annotation.dart';

part 'manifest_orders_request.g.dart';

/// Request model for manifesting printed orders
@JsonSerializable()
class ManifestOrdersRequest {

  /// Creates a new [ManifestOrdersRequest] instance
  const ManifestOrdersRequest({
    required this.orderIds,
  });

  /// Creates a [ManifestOrdersRequest] from JSON data
  factory ManifestOrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$ManifestOrdersRequestFromJson(json);
  /// List of printed order_ids to manifest
  final List<int> orderIds;

  /// Converts this [ManifestOrdersRequest] into JSON data
  Map<String, dynamic> toJson() => _$ManifestOrdersRequestToJson(this);
}
