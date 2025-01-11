import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'delivery_services_response.g.dart';

/// Response wrapper for the Delivery Services endpoint
/// ```
/// Attribute        Type          Description
/// services         object list   A list of available delivery services (Delivery Services - Service Model)
/// default_service  object        The name of the default service, if available, as configured by the user
/// success          boolean       Determines whether the request was successfully submitted
/// errors          object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable(explicitToJson: true)
class DeliveryServicesResponse {
  /// Creates a new delivery services response instance
  DeliveryServicesResponse({
    required this.services,
    this.defaultService,
    required this.success,
    this.errors,
  });

  /// List of available delivery services
  final List<DeliveryService> services;

  /// The default service, if available, as configured by the user
  @JsonKey(name: 'default_service')
  final DeliveryService? defaultService;

  /// Whether the request was successfully submitted
  final bool success;

  /// Optional list of detailed errors
  final List<StarShipItError>? errors;

  /// Creates a DeliveryServicesResponse from JSON
  factory DeliveryServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$DeliveryServicesResponseFromJson(json);

  /// Converts the DeliveryServicesResponse to JSON
  Map<String, dynamic> toJson() => _$DeliveryServicesResponseToJson(this);
}

/// Model for delivery service details
/// ```
/// Attribute      Type          Description
/// carrier        string        The carrier code
/// carrier_name   string        The carrier name
/// service_name   string        Description of the carrier service
/// service_code   string        Carrier service/product code
/// total_price    double        Price of service
/// metafields     object list   Additional options available for the carrier service
/// ```
@JsonSerializable(explicitToJson: true)
class DeliveryService {
  /// Creates a new delivery service instance
  DeliveryService({
    required this.carrier,
    required this.carrierName,
    required this.serviceName,
    required this.serviceCode,
    required this.totalPrice,
    required this.metafields,
    this.currency,
    this.pricingBreakdown,
  });

  /// The carrier code
  final String carrier;

  /// The carrier name
  @JsonKey(name: 'carrier_name')
  final String carrierName;

  /// Description of the carrier service
  @JsonKey(name: 'service_name')
  final String serviceName;

  /// Carrier service/product code
  @JsonKey(name: 'service_code')
  final String serviceCode;

  /// Price of service
  @JsonKey(name: 'total_price')
  final double totalPrice;

  /// Optional currency code
  final String? currency;

  /// Additional options available for the carrier service
  final List<DeliveryServiceMetaField> metafields;

  /// Optional pricing breakdown details
  @JsonKey(name: 'pricing_breakdown')
  final Map<String, String>? pricingBreakdown;

  /// Creates a DeliveryService from JSON
  factory DeliveryService.fromJson(Map<String, dynamic> json) =>
      _$DeliveryServiceFromJson(json);

  /// Converts the DeliveryService to JSON
  Map<String, dynamic> toJson() => _$DeliveryServiceToJson(this);
}

/// Model for delivery service meta field details
/// ```
/// Attribute         Type          Description
/// key               string        The unique identifier for the meta field
/// name              string        The display name of the meta field
/// description       string        The additional information about the meta field
/// display_type      string        States how the meta field should be display as 'checkbox', 'textbox' or 'dropdownlist'
/// value             string        The information to be stored as meta data
/// default_value     string        The default stored value for the meta data
/// available_values  string list   The values for 'dropdownlist' display type
/// ```
@JsonSerializable()
class DeliveryServiceMetaField {
  /// Creates a new delivery service meta field instance
  DeliveryServiceMetaField({
    required this.key,
    required this.name,
    required this.description,
    required this.displayType,
    required this.value,
    required this.defaultValue,
    this.availableValues,
  });

  /// The unique identifier for the meta field
  final String key;

  /// The display name of the meta field
  final String name;

  /// The additional information about the meta field
  final String description;

  /// States how the meta field should be displayed
  @JsonKey(name: 'display_type')
  final String displayType;

  /// The information to be stored as meta data
  final String value;

  /// The default stored value for the meta data
  @JsonKey(name: 'default_value')
  final String defaultValue;

  /// The values for 'dropdownlist' display type
  @JsonKey(name: 'available_values')
  final List<String>? availableValues;

  /// Creates a DeliveryServiceMetaField from JSON
  factory DeliveryServiceMetaField.fromJson(Map<String, dynamic> json) =>
      _$DeliveryServiceMetaFieldFromJson(json);

  /// Converts the DeliveryServiceMetaField to JSON
  Map<String, dynamic> toJson() => _$DeliveryServiceMetaFieldToJson(this);
}
