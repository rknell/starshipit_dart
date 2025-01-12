import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'delivery_services_request.g.dart';

/// Request model for getting available carrier delivery services.
///
/// Model fields and constraints:
/// - orderId: Optional int. Refresh rate for a specific order
/// - refreshRate: Optional bool. Whether to trigger rate refresh
/// - sender: Optional RateAddress. Sender address for rate request
/// - destination: Optional RateAddress. Destination address for rate request
/// - packages: Required List<RatePackage>. Package details
/// - declaredValue: Optional double. Value of the shipment
/// - includePricing: Optional bool. Whether to return pricing (default: false)
/// - returnOrder: Optional bool. Whether this is a return shipment (default: false)
/// - signatureRequired: Optional bool. Whether signature is required
/// - authorityToLeave: Optional bool. Whether package can be left without signature
/// - dangerousGoods: Optional bool. Whether package contains dangerous goods
/// - insuranceValue: Optional double. Amount of insurance coverage
@JsonSerializable()
class DeliveryServicesRequest {
  /// Creates a new [DeliveryServicesRequest] instance
  const DeliveryServicesRequest({
    this.orderId,
    this.refreshRate,
    this.sender,
    this.destination,
    required this.packages,
    this.declaredValue,
    this.includePricing = false,
    this.returnOrder = false,
    this.signatureRequired,
    this.authorityToLeave = false,
    this.dangerousGoods = false,
    this.insuranceValue = 0.0,
  });

  /// Factory constructor for creating a [DeliveryServicesRequest] instance from JSON data
  factory DeliveryServicesRequest.fromJson(Map<String, dynamic> json) =>
      _$DeliveryServicesRequestFromJson(json);

  /// Optional order ID to refresh rates for
  @JsonKey(name: 'order_id')
  final int? orderId;

  /// Whether to trigger a rate refresh
  @JsonKey(name: 'refresh_rate')
  final bool? refreshRate;

  /// Sender address details
  final RateAddress? sender;

  /// Destination address details
  final RateAddress? destination;

  /// List of packages to ship
  final List<RatePackage> packages;

  /// Declared value of the shipment
  @JsonKey(name: 'declared_value')
  final double? declaredValue;

  /// Whether to include pricing in response
  @JsonKey(name: 'include_pricing')
  final bool includePricing;

  /// Whether this is a return order
  @JsonKey(name: 'return_order')
  final bool returnOrder;

  /// Whether signature is required on delivery
  @JsonKey(name: 'signature_required')
  final bool? signatureRequired;

  /// Whether package can be left without signature
  @JsonKey(name: 'authority_to_leave')
  final bool authorityToLeave;

  /// Whether package contains dangerous goods
  @JsonKey(name: 'dangerous_goods')
  final bool dangerousGoods;

  /// Amount of insurance coverage
  @JsonKey(name: 'insurance_value')
  final double insuranceValue;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => _$DeliveryServicesRequestToJson(this);
}
