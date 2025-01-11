import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'get_filtered_addresses_response.g.dart';

/// Response wrapper for the Get Filtered Addresses endpoint
/// ```
/// Attribute     Type          Description
/// addresses     object list   Records for the addresses matching the supplied criteria (Address Model)
/// total_count   integer       Total number of records in the address book
/// success       boolean       Determines whether the request was successfully submitted
/// errors        object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable(explicitToJson: true)
class GetFilteredAddressesResponse {
  /// Creates a new get filtered addresses response instance
  GetFilteredAddressesResponse({
    required this.addresses,
    required this.totalCount,
    required this.success,
    this.errors,
  });

  /// Records for the addresses matching the supplied criteria
  final List<AddressBookAddress> addresses;

  /// Total number of records in the address book
  @JsonKey(name: 'total_count')
  final int totalCount;

  /// Whether the request was successfully submitted
  final bool success;

  /// Optional list of detailed errors
  final List<StarShipItError>? errors;

  /// Creates a GetFilteredAddressesResponse from JSON
  factory GetFilteredAddressesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFilteredAddressesResponseFromJson(json);

  /// Converts the GetFilteredAddressesResponse to JSON
  Map<String, dynamic> toJson() => _$GetFilteredAddressesResponseToJson(this);
}

/// Model for address book address details
/// ```
/// Attribute   Type        Description
/// id          integer     The unique numeric identifier for the address
/// name        string      Contact name at this address
/// company     string      The country name of receiver address
/// building    string      Name of the building at the address
/// street      string      Street Name and number
/// suburb      string      Suburb or locality
/// post_code   integer     Postal code
/// city        string      Town or city
/// state       string      State, region, province or county name
/// country     string      Country name
/// code        number      Internal identifier for this contact
/// telephone   string      Phone number for this contact
/// email       string      Email address for this contact
/// ```
@JsonSerializable()
class AddressBookAddress {
  /// Creates a new address book address instance
  AddressBookAddress({
    required this.id,
    required this.name,
    required this.company,
    this.building,
    required this.street,
    required this.suburb,
    required this.postCode,
    required this.city,
    required this.state,
    required this.country,
    required this.code,
    required this.telephone,
    required this.email,
  });

  /// The unique numeric identifier for the address
  final int id;

  /// Contact name at this address
  final String name;

  /// The company name
  final String company;

  /// Optional name of the building at the address
  final String? building;

  /// Street name and number
  final String street;

  /// Suburb or locality
  final String suburb;

  /// Postal code
  @JsonKey(name: 'post_code')
  final String postCode;

  /// Town or city
  final String city;

  /// State, region, province or county name
  final String state;

  /// Country name
  final String country;

  /// Internal identifier for this contact
  final String code;

  /// Phone number for this contact
  final String telephone;

  /// Email address for this contact
  final String email;

  /// Creates an AddressBookAddress from JSON
  factory AddressBookAddress.fromJson(Map<String, dynamic> json) =>
      _$AddressBookAddressFromJson(json);

  /// Converts the AddressBookAddress to JSON
  Map<String, dynamic> toJson() => _$AddressBookAddressToJson(this);
}
