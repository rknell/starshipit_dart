import 'package:json_annotation/json_annotation.dart';

part 'rate.g.dart';

/// Model representing a shipping rate from a carrier.
///
/// Model fields and constraints:
/// - serviceName: Required String. Human-readable carrier service description
/// - serviceCode: Required String. Unique carrier product/service identifier
/// - totalPrice: Required double. Price in requested currency
///
/// Example:
/// ```json
/// {
///   "service_name": "PARCEL POST + SIGNATURE",
///   "service_code": "7B05",
///   "total_price": 12.05
/// }
/// ```
@JsonSerializable()
class Rate {
  /// Creates a new [Rate] instance
  ///
  /// [serviceName] must be a non-empty string describing the service
  /// [serviceCode] must be a valid carrier service code
  /// [totalPrice] must be a positive number in the requested currency
  const Rate({
    required this.serviceName,
    required this.serviceCode,
    required this.totalPrice,
  });

  /// Factory constructor for creating a [Rate] instance from JSON data
  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);

  /// Description of the carrier service.
  ///
  /// Constraints:
  /// - Required field
  /// - Must be a non-empty string
  /// - Human-readable description (e.g. "PARCEL POST + SIGNATURE")
  final String serviceName;

  /// Carrier service/product code.
  ///
  /// Constraints:
  /// - Required field
  /// - Must be a valid carrier service code
  /// - Format varies by carrier (e.g. "7B05")
  final String serviceCode;

  /// Price of service in the requested currency.
  ///
  /// Constraints:
  /// - Required field
  /// - Must be a positive number
  /// - Currency matches the request currency or account default
  final double totalPrice;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => _$RateToJson(this);
}
