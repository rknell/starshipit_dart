import 'package:json_annotation/json_annotation.dart';

part 'manifest_shipments_request.g.dart';

/// Request wrapper for the Manifest Orders endpoint
/// ```
/// Parameter           Type          Description
/// tracking_numbers    object list   List of tracking numbers or order numbers for shipments to be included in the manifest
/// use_order_numbers   boolean       Indicates the tracking_numbers parameter contains tracking numbers or order numbers
/// ```
@JsonSerializable()
class ManifestShipmentsRequest {
  /// Creates a new manifest shipments request instance
  ManifestShipmentsRequest({
    required this.trackingNumbers,
    required this.useOrderNumbers,
  });

  /// List of tracking numbers or order numbers for shipments to be included in the manifest
  @JsonKey(name: 'tracking_numbers')
  final List<String> trackingNumbers;

  /// Indicates the tracking_numbers parameter contains tracking numbers or order numbers
  @JsonKey(name: 'use_order_numbers')
  final bool useOrderNumbers;

  /// Creates a ManifestShipmentsRequest from JSON
  factory ManifestShipmentsRequest.fromJson(Map<String, dynamic> json) =>
      _$ManifestShipmentsRequestFromJson(json);

  /// Converts the ManifestShipmentsRequest to JSON
  Map<String, dynamic> toJson() => _$ManifestShipmentsRequestToJson(this);
}
