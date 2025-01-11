import 'package:json_annotation/json_annotation.dart';

part 'delete_address_request.g.dart';

/// Request wrapper for the Delete Address endpoint
/// ```
/// Parameter     Type          Description
/// address_ids   object list   List containing the unique identifier of the address records to be removed
/// ```
@JsonSerializable()
class DeleteAddressRequest {
  /// Creates a new delete address request instance
  DeleteAddressRequest({
    required this.addressIds,
  });

  /// List of address IDs to delete
  @JsonKey(name: 'address_ids')
  final List<int> addressIds;

  /// Creates a DeleteAddressRequest from JSON
  factory DeleteAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteAddressRequestFromJson(json);

  /// Converts the DeleteAddressRequest to JSON
  Map<String, dynamic> toJson() => _$DeleteAddressRequestToJson(this);
}
