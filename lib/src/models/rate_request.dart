import 'package:json_annotation/json_annotation.dart';

part 'rate_request.g.dart';

/// Request wrapper for the Get Rates endpoint
/// ```
/// Parameter     Type            Description
/// sender        object          Sender address details (Rate Sender Address Model)
/// destination   object          Shipping address details (Rate Destination Address Model)
/// packages      object list     A list of packages with weight and dimensions (Rate Package Model)
/// currency      string          Currency code for the order value (max length: 3) e.g. AUD
/// ```
@JsonSerializable(explicitToJson: true)
class RateRequest {
  /// Creates a new rate request instance
  RateRequest({
    this.sender,
    required this.destination,
    required this.packages,
    this.currency,
  });

  /// Creates a RateRequest from JSON
  factory RateRequest.fromJson(Map<String, dynamic> json) =>
      _$RateRequestFromJson(json);

  /// Optional sender address details. If not provided, pickup address details from Settings are used
  final RateSenderAddress? sender;

  /// Required shipping address details
  final RateDestinationAddress destination;

  /// List of packages with weight and dimensions
  final List<RatePackage> packages;

  /// Optional currency code for the order value (max length: 3) e.g. AUD
  final String? currency;

  /// Converts the RateRequest to JSON
  Map<String, dynamic> toJson() => _$RateRequestToJson(this);
}

/// Model for sender address details in a rate request
/// ```
/// Attribute      Type     Description
/// street         string   Street number and name of the sender address
/// suburb         string   Suburb of the sender address
/// city           string   City of the sender address
/// state          string   State, regional, provincial or county name of the sender address
/// post_code      string   Postal or zip code of the sender address
/// country_code   string   The country code of the sender address
/// ```
@JsonSerializable()
class RateSenderAddress {
  /// Creates a new rate sender address instance
  RateSenderAddress({
    required this.street,
    required this.suburb,
    required this.city,
    required this.state,
    required this.postCode,
    required this.countryCode,
  });

  /// Creates a RateSenderAddress from JSON
  factory RateSenderAddress.fromJson(Map<String, dynamic> json) =>
      _$RateSenderAddressFromJson(json);

  /// Street number and name of the sender address
  final String street;

  /// Suburb of the sender address
  final String suburb;

  /// City of the sender address
  final String city;

  /// State, regional, provincial or county name of the sender address
  final String state;

  /// Postal or zip code of the sender address
  @JsonKey(name: 'post_code')
  final String postCode;

  /// The country code of the sender address
  @JsonKey(name: 'country_code')
  final String countryCode;

  /// Converts the RateSenderAddress to JSON
  Map<String, dynamic> toJson() => _$RateSenderAddressToJson(this);
}

/// Model for destination address details in a rate request
/// ```
/// Attribute      Type     Description
/// street         string   Street number and name of the delivery address
/// suburb         string   Suburb of the delivery address
/// city           string   City of the delivery address
/// state          string   State, regional, provincial or county name of the delivery address
/// post_code      string   Postal or zip code of the delivery address
/// country_code   string   The country code of the delivery address
/// ```
@JsonSerializable()
class RateDestinationAddress {
  /// Creates a new rate destination address instance
  RateDestinationAddress({
    required this.street,
    required this.suburb,
    required this.city,
    required this.state,
    required this.postCode,
    required this.countryCode,
  });

  /// Creates a RateDestinationAddress from JSON
  factory RateDestinationAddress.fromJson(Map<String, dynamic> json) =>
      _$RateDestinationAddressFromJson(json);

  /// Street number and name of the delivery address
  final String street;

  /// Suburb of the delivery address
  final String suburb;

  /// City of the delivery address
  final String city;

  /// State, regional, provincial or county name of the delivery address
  final String state;

  /// Postal or zip code of the delivery address
  @JsonKey(name: 'post_code')
  final String postCode;

  /// The country code of the delivery address
  @JsonKey(name: 'country_code')
  final String countryCode;

  /// Converts the RateDestinationAddress to JSON
  Map<String, dynamic> toJson() => _$RateDestinationAddressToJson(this);
}

/// Model for package details in a rate request
/// ```
/// Attribute   Type             Description
/// weight      double           Physical weight of the parcel in kilograms (kg)
/// height      double           Height of the parcel in meters (m)
/// width       double           Width of the parcel in meters (m)
/// length      double           Length of the parcel in meters (m)
/// ```
@JsonSerializable()
class RatePackage {
  /// Creates a new rate package instance
  RatePackage({
    required this.weight,
    this.height,
    this.width,
    this.length,
  });

  /// Creates a RatePackage from JSON
  factory RatePackage.fromJson(Map<String, dynamic> json) =>
      _$RatePackageFromJson(json);

  /// Physical weight of the parcel in kilograms (kg)
  final double weight;

  /// Height of the parcel in meters (m)
  final double? height;

  /// Width of the parcel in meters (m)
  final double? width;

  /// Length of the parcel in meters (m)
  final double? length;

  /// Converts the RatePackage to JSON
  Map<String, dynamic> toJson() => _$RatePackageToJson(this);
}
