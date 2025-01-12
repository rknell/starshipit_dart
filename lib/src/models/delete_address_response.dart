import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'delete_address_response.g.dart';

/// Response wrapper for the Delete Address endpoint
/// ```
/// Attribute   Type          Description
/// success     boolean       Determines whether the request was successfully submitted
/// errors      object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable()
class DeleteAddressResponse {
  /// Creates a new delete address response instance
  DeleteAddressResponse({
    required this.success,
    this.errors,
  });

  /// Creates a DeleteAddressResponse from JSON
  factory DeleteAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAddressResponseFromJson(json);

  /// Whether the request was successfully submitted
  final bool success;

  /// Optional list of detailed errors
  final List<StarShipItError>? errors;

  /// Converts the DeleteAddressResponse to JSON
  Map<String, dynamic> toJson() => _$DeleteAddressResponseToJson(this);
}
