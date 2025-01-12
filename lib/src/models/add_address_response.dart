import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'add_address_response.g.dart';

/// Response wrapper for the Add Address endpoint
/// ```
/// Attribute   Type          Description
/// id          integer       Unique identifier for the record that has just been added
/// address     object        The updated address record (Address Detail Model)
/// success     boolean       Determines whether the request was successfully submitted
/// errors      object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable()
class AddAddressResponse {
  /// Creates a new add address response instance
  AddAddressResponse({
    required this.id,
    required this.address,
    required this.success,
    this.errors,
  });

  /// Creates an AddAddressResponse from JSON
  factory AddAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddAddressResponseFromJson(json);

  /// Unique identifier for the record that has just been added
  final int id;

  /// The updated address record
  final AddressDetail address;

  /// Whether the request was successfully submitted
  final bool success;

  /// Optional list of detailed errors
  final List<StarShipItError>? errors;

  /// Converts the AddAddressResponse to JSON
  Map<String, dynamic> toJson() => _$AddAddressResponseToJson(this);
}
