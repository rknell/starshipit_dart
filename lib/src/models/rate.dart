import 'package:json_annotation/json_annotation.dart';
import 'carrier.dart';

part 'rate.g.dart';

/// Model for a shipping rate
@JsonSerializable(explicitToJson: true)
class Rate {
  /// The carrier offering this rate
  @JsonKey(
    fromJson: _carrierFromJson,
    toJson: _carrierToJson,
  )
  final Carrier carrier;

  /// The carrier's service code
  @JsonKey(name: 'service_code')
  final String serviceCode;

  /// The carrier's service name
  @JsonKey(name: 'service_name')
  final String serviceName;

  /// The total cost of shipping
  final double cost;

  /// The currency code for the cost (e.g., AUD, NZD)
  final String currency;

  /// Estimated delivery time in days
  @JsonKey(name: 'delivery_time')
  final int? deliveryTime;

  /// Creates a new [Rate] instance
  const Rate({
    required this.carrier,
    required this.serviceCode,
    required this.serviceName,
    required this.cost,
    required this.currency,
    this.deliveryTime,
  });

  /// Creates a [Rate] from JSON map
  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);

  /// Converts this [Rate] to a JSON map
  Map<String, dynamic> toJson() => _$RateToJson(this);

  static Carrier _carrierFromJson(String value) => Carrier.values.firstWhere(
        (carrier) => carrier.toString().split('.').last == value,
        orElse: () => throw ArgumentError('Invalid carrier name: $value'),
      );

  static String _carrierToJson(Carrier carrier) =>
      carrier.toString().split('.').last;
}
