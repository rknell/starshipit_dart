import 'package:json_annotation/json_annotation.dart';

part 'delivery_services_request.g.dart';

/// Request wrapper for the Delivery Services endpoint
/// ```
/// Parameter               Type        Description
/// order_id               int         Refresh the rate for a specified order ID
/// refresh_rate           boolean     Trigger the rate to be refreshed
/// sender                 object      The Sender address that should be used for the rate request
/// destination           object      The destination address that should be used for the request
/// packages              object[]    Packages of the order (Delivery Services - Package Model)
/// declared_value        float       The value of the shipment
/// include_pricing       boolean     Whether to return pricing in the response. Defaults to false.
/// return_order         boolean     Whether the shipment is a return order. Defaults to false
/// signature_required    boolean     Whether signature is required for delivery
/// authority_to_leave   boolean     Whether package can be left without signature
/// dangerous_goods      boolean     Whether the shipment contains dangerous goods
/// insurance_value      float       The amount of insurance included on the shipment
/// ```
@JsonSerializable(explicitToJson: true)
class DeliveryServicesRequest {
  /// Creates a new delivery services request instance
  DeliveryServicesRequest({
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

  /// Optional order ID to refresh rate for
  @JsonKey(name: 'order_id')
  final int? orderId;

  /// Whether to trigger a rate refresh
  @JsonKey(name: 'refresh_rate')
  final bool? refreshRate;

  /// Optional sender address details
  final DeliveryServicesSender? sender;

  /// Optional destination address details
  final DeliveryServicesDestination? destination;

  /// List of packages for the order
  final List<DeliveryServicesPackage> packages;

  /// Optional declared value of the shipment
  @JsonKey(name: 'declared_value')
  final double? declaredValue;

  /// Whether to include pricing in the response
  @JsonKey(name: 'include_pricing')
  final bool includePricing;

  /// Whether this is a return order
  @JsonKey(name: 'return_order')
  final bool returnOrder;

  /// Whether signature is required for delivery
  @JsonKey(name: 'signature_required')
  final bool? signatureRequired;

  /// Whether package can be left without signature
  @JsonKey(name: 'authority_to_leave')
  final bool authorityToLeave;

  /// Whether the shipment contains dangerous goods
  @JsonKey(name: 'dangerous_goods')
  final bool dangerousGoods;

  /// Amount of insurance included on the shipment
  @JsonKey(name: 'insurance_value')
  final double insuranceValue;

  /// Creates a DeliveryServicesRequest from JSON
  factory DeliveryServicesRequest.fromJson(Map<String, dynamic> json) =>
      _$DeliveryServicesRequestFromJson(json);

  /// Converts the DeliveryServicesRequest to JSON
  Map<String, dynamic> toJson() => _$DeliveryServicesRequestToJson(this);
}

/// Model for sender address details in a delivery services request
/// ```
/// Attribute      Type     Description
/// street         string   Street number and name of the sender address
/// suburb         string   Suburb of the sender address
/// city           string   City of the sender address
/// state          string   State of the sender address
/// post_code      string   Postal or zip code of the sender address
/// country_code   string   The country code of the sender address
/// ```
@JsonSerializable()
class DeliveryServicesSender {
  /// Creates a new delivery services sender instance
  DeliveryServicesSender({
    required this.street,
    required this.suburb,
    required this.city,
    required this.state,
    required this.postCode,
    required this.countryCode,
  });

  /// Street number and name of the sender address
  final String street;

  /// Suburb of the sender address
  final String suburb;

  /// City of the sender address
  final String city;

  /// State of the sender address
  final String state;

  /// Postal or zip code of the sender address
  @JsonKey(name: 'post_code')
  final String postCode;

  /// The country code of the sender address
  @JsonKey(name: 'country_code')
  final String countryCode;

  /// Creates a DeliveryServicesSender from JSON
  factory DeliveryServicesSender.fromJson(Map<String, dynamic> json) =>
      _$DeliveryServicesSenderFromJson(json);

  /// Converts the DeliveryServicesSender to JSON
  Map<String, dynamic> toJson() => _$DeliveryServicesSenderToJson(this);
}

/// Model for destination address details in a delivery services request
/// ```
/// Attribute      Type     Description
/// street         string   Street number and name of the delivery address
/// suburb         string   Suburb of the delivery address
/// city           string   City of the delivery address
/// state          string   State of the delivery address
/// post_code      string   Postal or zip code of the delivery address
/// country_code   string   The country code of the delivery address
/// ```
@JsonSerializable()
class DeliveryServicesDestination {
  /// Creates a new delivery services destination instance
  DeliveryServicesDestination({
    required this.street,
    required this.suburb,
    required this.city,
    required this.state,
    required this.postCode,
    required this.countryCode,
  });

  /// Street number and name of the delivery address
  final String street;

  /// Suburb of the delivery address
  final String suburb;

  /// City of the delivery address
  final String city;

  /// State of the delivery address
  final String state;

  /// Postal or zip code of the delivery address
  @JsonKey(name: 'post_code')
  final String postCode;

  /// The country code of the delivery address
  @JsonKey(name: 'country_code')
  final String countryCode;

  /// Creates a DeliveryServicesDestination from JSON
  factory DeliveryServicesDestination.fromJson(Map<String, dynamic> json) =>
      _$DeliveryServicesDestinationFromJson(json);

  /// Converts the DeliveryServicesDestination to JSON
  Map<String, dynamic> toJson() => _$DeliveryServicesDestinationToJson(this);
}

/// Model for package details in a delivery services request
/// ```
/// Attribute   Type     Description
/// weight      double   Physical weight of the parcel in kilograms (kg)
/// height      double   Height of the parcel in meters (m)
/// width       double   Width of the parcel in meters (m)
/// length      double   Length of the parcel in meters (m)
/// ```
@JsonSerializable()
class DeliveryServicesPackage {
  /// Creates a new delivery services package instance
  DeliveryServicesPackage({
    required this.weight,
    this.height,
    this.width,
    this.length,
  });

  /// Physical weight of the parcel in kilograms (kg)
  final double weight;

  /// Height of the parcel in meters (m)
  final double? height;

  /// Width of the parcel in meters (m)
  final double? width;

  /// Length of the parcel in meters (m)
  final double? length;

  /// Creates a DeliveryServicesPackage from JSON
  factory DeliveryServicesPackage.fromJson(Map<String, dynamic> json) =>
      _$DeliveryServicesPackageFromJson(json);

  /// Converts the DeliveryServicesPackage to JSON
  Map<String, dynamic> toJson() => _$DeliveryServicesPackageToJson(this);
}
