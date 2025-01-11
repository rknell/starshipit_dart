import 'package:json_annotation/json_annotation.dart';
import 'sender_details.dart';
import 'destination_details.dart';
import 'create_order_package.dart';

part 'get_rates_request.g.dart';

/// Request model for getting available shipping rates
@JsonSerializable(explicitToJson: true)
class GetRatesRequest {
  /// Sender address and contact details
  @JsonKey(name: 'sender_details')
  final SenderDetails senderDetails;

  /// Shipping address and contact details
  final DestinationDetails destination;

  /// Package list containing the parcel details
  final List<CreateOrderPackage> packages;

  /// Creates a new [GetRatesRequest] instance
  const GetRatesRequest({
    required this.senderDetails,
    required this.destination,
    required this.packages,
  });

  /// Creates a [GetRatesRequest] from JSON map
  factory GetRatesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetRatesRequestFromJson(json);

  /// Converts this [GetRatesRequest] to a JSON map
  Map<String, dynamic> toJson() => _$GetRatesRequestToJson(this);
}
