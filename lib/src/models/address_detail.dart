import 'package:json_annotation/json_annotation.dart';

part 'address_detail.g.dart';

/// Model representing detailed address information
/// ```
/// Attribute           Type      Description
/// code               string    The unique internal identifier for the address
/// name               string    Contact name at this address
/// company            string    The country name of receiver address
/// post_code          string    Postal code
/// street             string    Street Name and number
/// suburb             string    Suburb or locality
/// city               string    Town or city
/// state              string    State, region, province or county name
/// country            string    Country name
/// phone              string    Phone number for this contact
/// instructions       string    Delivery instructions when placing an order with the carrier
/// building           string    Name of the building at the address
/// email              string    Email address for this contact
/// carrier            integer   Default carrier to use for this contact
/// signature_required boolean   Default value for signature required on customer orders
/// ```
@JsonSerializable()
class AddressDetail {
  /// Creates a new address detail instance
  AddressDetail({
    required this.code,
    required this.name,
    required this.company,
    required this.postCode,
    required this.street,
    required this.suburb,
    required this.city,
    required this.state,
    required this.country,
    required this.phone,
    this.instructions = '',
    required this.building,
    required this.email,
    required this.carrier,
    required this.signatureRequired,
  });

  /// The unique internal identifier for the address
  final String code;

  /// Contact name at this address
  final String name;

  /// The company name
  final String company;

  /// Postal code
  @JsonKey(name: 'post_code')
  final String postCode;

  /// Street name and number
  final String street;

  /// Suburb or locality
  final String suburb;

  /// Town or city
  final String city;

  /// State, region, province or county name
  final String state;

  /// Country name
  final String country;

  /// Phone number for this contact
  final String phone;

  /// Delivery instructions when placing an order with the carrier
  final String instructions;

  /// Name of the building at the address
  final String building;

  /// Email address for this contact
  final String email;

  /// Default carrier to use for this contact
  final int carrier;

  /// Default value for signature required on customer orders
  @JsonKey(name: 'signature_required')
  final bool signatureRequired;

  /// Creates an AddressDetail from JSON
  factory AddressDetail.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailFromJson(json);

  /// Converts the AddressDetail to JSON
  Map<String, dynamic> toJson() => _$AddressDetailToJson(this);
}
