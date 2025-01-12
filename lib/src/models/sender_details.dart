import 'package:json_annotation/json_annotation.dart';

part 'sender_details.g.dart';

/// Represents sender details in the StarShipIT API
@JsonSerializable()
class SenderDetails {
  /// Creates a new sender details instance
  SenderDetails({
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
            'country must be between 2 and 100 characters');

  /// Creates a SenderDetails instance from JSON
  factory SenderDetails.fromJson(Map<String, dynamic> json) =>
      _$SenderDetailsFromJson(json);

  /// Contact name of the sender (max length: 100)
  final String name;

  /// Contact email address of the sender (max length: 100)
  final String? email;

  /// Contact phone number of the sender (max length: 100)
  final String? phone;

  /// Building name of the pickup address (max length: 100)
  final String? building;

  /// Name of company that the parcel is being sent from (max length: 100)
  final String? company;

  /// Street number and name of the pickup address (max length: 100)
  final String street;

  /// Suburb of the pickup address (max length: 100)
  final String suburb;

  /// City of the pickup address (max length: 100)
  final String? city;

  /// Regional, provincial or county name of the pickup address (max length: 100)
  final String? state;

  /// Postal or zip code of the pickup address (max length: 10)
  @JsonKey(name: 'post_code')
  final String? postCode;

  /// The country name of pickup address (min length: 2, max length: 100)
  final String country;

  /// Converts the SenderDetails instance to JSON
  Map<String, dynamic> toJson() => _$SenderDetailsToJson(this);
}
