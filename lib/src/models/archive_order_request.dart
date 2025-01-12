import 'package:json_annotation/json_annotation.dart';

part 'archive_order_request.g.dart';

/// Request wrapper for the Archive Order endpoint
/// ```
/// Attribute   Type     Description
/// order_id   integer   The unique numeric identifier for the order
/// ```
@JsonSerializable()
class ArchiveOrderRequest {
  /// Creates a new archive order request instance
  ArchiveOrderRequest({
    required this.orderId,
  });

  /// Creates an ArchiveOrderRequest from JSON
  factory ArchiveOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$ArchiveOrderRequestFromJson(json);

  /// The unique numeric identifier for the order
  @JsonKey(name: 'order_id')
  final int orderId;

  /// Converts the ArchiveOrderRequest to JSON
  Map<String, dynamic> toJson() => _$ArchiveOrderRequestToJson(this);

  /// Converts the request to query parameters
  Map<String, String> toQueryParameters() => {
        'order_id': orderId.toString(),
      };
}
