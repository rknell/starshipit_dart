import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'update_address_response.g.dart';

/// Response wrapper for the Update Address endpoint
/// ```
/// Attribute   Type          Description
/// address     object        The updated address record (Address Detail Model)
/// success     boolean       Determines whether the request was successfully submitted
/// errors      object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable()
class UpdateAddressResponse {
  /// Creates a new update address response instance
  UpdateAddressResponse({
    required this.address,
    required this.success,
    this.errors,
  });

  /// Creates an UpdateAddressResponse from JSON
  factory UpdateAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddressResponseFromJson(json);

  /// The updated address record
  final AddressDetail address;

  /// Whether the request was successfully submitted
  final bool success;

  /// Optional list of detailed errors
  final List<StarShipItError>? errors;

  /// Converts the UpdateAddressResponse to JSON
  Map<String, dynamic> toJson() => _$UpdateAddressResponseToJson(this);
}
