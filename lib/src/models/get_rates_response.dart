import 'package:json_annotation/json_annotation.dart';
import 'error.dart';
import 'rate.dart';

part 'get_rates_response.g.dart';

/// Response model for getting available shipping rates
@JsonSerializable(explicitToJson: true)
class GetRatesResponse {
  /// List of available shipping rates
  final List<Rate> rates;

  /// Whether the request was successful
  final bool success;

  /// List of errors if the request was not successful
  final List<StarShipItError>? errors;

  /// Creates a new [GetRatesResponse] instance
  const GetRatesResponse({
    required this.rates,
    required this.success,
    this.errors,
  });

  /// Creates a [GetRatesResponse] from JSON map
  factory GetRatesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRatesResponseFromJson(json);

  /// Converts this [GetRatesResponse] to a JSON map
  Map<String, dynamic> toJson() => _$GetRatesResponseToJson(this);
}
