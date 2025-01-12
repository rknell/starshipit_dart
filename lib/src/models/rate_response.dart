import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'rate_response.g.dart';

/// Response wrapper for the Get Rates endpoint
/// ```
/// Attribute   Type          Description
/// rates       object list   A list of available shipping rates (GetRatesRate Model)
/// success     boolean       Determines whether the request was successfully submitted
/// errors      object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable(explicitToJson: true)
class RateResponse {
  /// Creates a new rate response instance
  RateResponse({
    required this.rates,
    required this.success,
    this.errors,
  });

  /// Creates a RateResponse from JSON
  factory RateResponse.fromJson(Map<String, dynamic> json) =>
      _$RateResponseFromJson(json);

  /// List of available shipping rates
  final List<GetRatesRate> rates;

  /// Whether the request was successfully submitted
  final bool success;

  /// Optional list of detailed errors
  final List<StarShipItError>? errors;

  /// Converts the RateResponse to JSON
  Map<String, dynamic> toJson() => _$RateResponseToJson(this);
}

/// Model for shipping rate details
/// ```
/// Attribute      Type     Description
/// service_name   string   Description of the carrier service
/// service_code   string   Carrier service/product code
/// total_price    number   Price of service
/// ```
@JsonSerializable()
class GetRatesRate {
  /// Creates a new rate instance
  GetRatesRate({
    required this.serviceName,
    required this.serviceCode,
    required this.totalPrice,
  });

  /// Creates a GetRatesRate from JSON
  factory GetRatesRate.fromJson(Map<String, dynamic> json) =>
      _$GetRatesRateFromJson(json);

  /// Description of the carrier service
  @JsonKey(name: 'service_name')
  final String serviceName;

  /// Carrier service/product code
  @JsonKey(name: 'service_code')
  final String serviceCode;

  /// Price of service
  @JsonKey(name: 'total_price')
  final double totalPrice;

  /// Converts the GetRatesRate to JSON
  Map<String, dynamic> toJson() => _$GetRatesRateToJson(this);
}
