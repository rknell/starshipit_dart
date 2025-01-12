import 'package:json_annotation/json_annotation.dart';

part 'destination_details.g.dart';

/// Represents destination details in the StarShipIT API
@JsonSerializable()
class DestinationDetails {
  /// Creates a new destination details instance
  DestinationDetails({
    required this.name,
    this.email,
    this.phone,
    this.building,
    this.company,
    required this.street,
    required this.suburb,
    this.city,
    this.state,
    this.postCode,
    required this.country,
    this.deliveryInstructions,
    this.taxNumbers,
    this.taxNumber,
  })  : assert(name.length <= 100, 'name must not exceed 100 characters'),
        assert(email == null || email.length <= 100,
            'email must not exceed 100 characters'),
        assert(phone == null || phone.length <= 100,
            'phone must not exceed 100 characters'),
        assert(building == null || building.length <= 100,
            'building must not exceed 100 characters'),
        assert(company == null || company.length <= 100,
            'company must not exceed 100 characters'),
        assert(street.length <= 100, 'street must not exceed 100 characters'),
        assert(suburb.length <= 100, 'suburb must not exceed 100 characters'),
        assert(city == null || city.length <= 100,
            'city must not exceed 100 characters'),
        assert(state == null || state.length <= 100,
            'state must not exceed 100 characters'),
        assert(postCode == null || postCode.length <= 10,
            'post_code must not exceed 10 characters'),
        assert(country.length >= 2 && country.length <= 100,
            'country must be between 2 and 100 characters'),
        assert(
            deliveryInstructions == null || deliveryInstructions.length <= 100,
            'delivery_instructions must not exceed 100 characters'),
        assert(taxNumber == null || taxNumber.length <= 20,
            'tax_number must not exceed 20 characters');

  /// Creates a DestinationDetails instance from JSON
  factory DestinationDetails.fromJson(Map<String, dynamic> json) =>
      _$DestinationDetailsFromJson(json);

  /// Contact name of the receiver (max length: 100)
  final String name;

  /// Contact email address of the receiver (max length: 100)
  final String? email;

  /// Contact phone number of the receiver (max length: 100)
  final String? phone;

  /// Building name of the delivery address (max length: 100)
  final String? building;

  /// Name of company that the parcel is being delivered to (max length: 100)
  final String? company;

  /// Street number and name of the delivery address (max length: 100)
  final String street;

  /// Suburb of the delivery address (max length: 100)
  final String suburb;

  /// City of the delivery address (max length: 100)
  final String? city;

  /// Regional, provincial or county name of the delivery address (max length: 100)
  final String? state;

  /// Postal or zip code of the delivery address (max length: 10)
  @JsonKey(name: 'post_code')
  final String? postCode;

  /// The country name of delivery address (min length: 2, max length: 100)
  final String country;

  /// Delivery instructions for courier (max length: 100)
  @JsonKey(name: 'delivery_instructions')
  final String? deliveryInstructions;

  /// List of receiver tax numbers
  @JsonKey(name: 'tax_numbers')
  final List<String>? taxNumbers;

  /// Recipient tax number (max length: 20)
  @JsonKey(name: 'tax_number')
  final String? taxNumber;

  /// Converts the DestinationDetails instance to JSON
  Map<String, dynamic> toJson() => _$DestinationDetailsToJson(this);
}
