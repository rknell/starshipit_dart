import 'package:json_annotation/json_annotation.dart';
import 'error.dart';

part 'archive_order_response.g.dart';

/// Response from the Archive Order endpoint
/// ```
/// Attribute   Type          Description
/// success     boolean       Determines whether the request was successfully submitted
/// errors      object list   List of detailed errors (Error Model)
/// ```
@JsonSerializable()
class ArchiveOrderResponse {
  /// Creates a new archive order response instance
  ArchiveOrderResponse({
    required this.success,
    this.errors,
  });

  /// Whether the request was successfully submitted
  final bool success;

  /// List of errors if the request failed
  final List<StarShipItError>? errors;

  /// Creates an ArchiveOrderResponse from JSON
  factory ArchiveOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$ArchiveOrderResponseFromJson(json);

  /// Converts the ArchiveOrderResponse to JSON
  Map<String, dynamic> toJson() => _$ArchiveOrderResponseToJson(this);
}
