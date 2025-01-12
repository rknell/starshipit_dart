import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'get_rates_request.g.dart';

/// Request model for getting a quote for a shipment.
///
/// Model fields and constraints:
/// - sender: Optional [RateAddress]. If null, uses pickup address from Settings
/// - destination: Required [RateAddress]. Must contain valid address details
/// - packages: Required non-empty List<[RatePackage]>. Each package must have weight
/// - currency: Optional String. If provided, must be 3 characters (e.g. "AUD")
///
/// The endpoint for this request is:
/// ```
/// POST https://api.starshipit.com/api/rates
/// ```
///
/// Required headers:
/// - Content-Type: application/json
/// - StarShipIT-Api-Key: Your API key from Settings > API > API Key
/// - Ocp-Apim-Subscription-Key: Your subscription key from Settings > API > Subscription key
@JsonSerializable()
class GetRatesRequest {
  /// Creates a new [GetRatesRequest] instance
  ///
  /// [destination] must be a valid address with all required fields
  /// [packages] must contain at least one package with weight specified
  /// [currency] if provided must be a 3-character currency code
  const GetRatesRequest({
    this.sender,
    required this.destination,
    required this.packages,
    this.currency,
  });

  /// Factory constructor for creating a [GetRatesRequest] instance from JSON data
  factory GetRatesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetRatesRequestFromJson(json);

  /// Sender address details. If not provided, pickup address from Settings is used.
  ///
  /// Constraints:
  /// - Optional field
  /// - If provided, must be a valid [RateAddress]
  /// - If null, system will use the Pickup Address from StarShipIT Settings
  final RateAddress? sender;

  /// Shipping address details for the destination.
  ///
  /// Constraints:
  /// - Required field
  /// - Must be a valid [RateAddress]
  final RateAddress destination;

  /// List of packages with weight and dimensions.
  ///
  /// Constraints:
  /// - Required field
  /// - Must contain at least one package
  /// - Each item must be a valid [RatePackage]
  final List<RatePackage> packages;

  /// Currency code for the order value.
  ///
  /// Constraints:
  /// - Optional field
  /// - If provided, must be exactly 3 characters
  /// - Must be a valid currency code (e.g. "AUD", "USD", "NZD")
  final String? currency;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => _$GetRatesRequestToJson(this);
}
