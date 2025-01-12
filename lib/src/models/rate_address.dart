import 'package:json_annotation/json_annotation.dart';

part 'rate_address.g.dart';

/// Address model used for rate requests, representing either a sender or destination address.
@JsonSerializable()
class RateAddress {
  /// Creates a new [RateAddress] instance
  const RateAddress({
    required this.street,
    required this.suburb,
    required this.city,
    required this.state,
    required this.postCode,
    required this.countryCode,
  });

  /// Factory constructor for creating a [RateAddress] instance from JSON data
  factory RateAddress.fromJson(Map<String, dynamic> json) =>
      _$RateAddressFromJson(json);

  /// Street number and name of the address
  final String street;

  /// Suburb of the address
  final String suburb;

  /// City of the address
  final String city;

  /// State, regional, provincial or county name of the address
  final String state;

  /// Postal or zip code of the address
  final String postCode;

  /// The country code of the address
  final String countryCode;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => _$RateAddressToJson(this);
}
