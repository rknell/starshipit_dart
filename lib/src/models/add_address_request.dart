import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'add_address_request.g.dart';

/// Request wrapper for the Add Address endpoint
/// ```
/// Parameter   Type      Description
/// address     object    Address details for the new contact
/// ```
@JsonSerializable()
class AddAddressRequest {
  /// Creates a new add address request instance
  AddAddressRequest({
    required this.address,
  });

  /// Address details for the new contact
  final AddressDetail address;

  /// Creates an AddAddressRequest from JSON
  factory AddAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$AddAddressRequestFromJson(json);

  /// Converts the AddAddressRequest to JSON
  Map<String, dynamic> toJson() => _$AddAddressRequestToJson(this);
}
