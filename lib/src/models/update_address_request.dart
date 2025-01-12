import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'update_address_request.g.dart';

/// Request wrapper for the Update Address endpoint
/// ```
/// Parameter   Type      Description
/// id          integer   Unique identifier for the record to be updated
/// address     object    Updated address details for the contact
/// ```
@JsonSerializable()
class UpdateAddressRequest {
  /// Creates a new update address request instance
  UpdateAddressRequest({
    required this.id,
    required this.address,
  });

  /// Creates an UpdateAddressRequest from JSON
  factory UpdateAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddressRequestFromJson(json);

  /// Unique identifier for the record to be updated
  final int id;

  /// Updated address details for the contact
  final AddressDetail address;

  /// Converts the UpdateAddressRequest to JSON
  Map<String, dynamic> toJson() => _$UpdateAddressRequestToJson(this);
}
