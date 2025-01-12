import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'get_rates_response.g.dart';

/// Response model for getting shipping rates.
///
/// Model fields and constraints:
/// - rates: Required List<[Rate]>. May be empty if no rates found
/// - success: Required bool. Indicates if request was processed
/// - errors: Optional List<[StarShipItError]>. Present if success is false
///
/// Example response:
/// ```json
/// {
///   "rates": [
///     {
///       "service_name": "PARCEL POST + SIGNATURE",
///       "service_code": "7B05",
///       "total_price": 12.05
///     },
///     {
///       "service_name": "EXPRESS POST + SIGNATURE",
///       "service_code": "7B05",
///       "total_price": 14.65
///     }
///   ],
///   "success": true
/// }
/// ```
@JsonSerializable()
class GetRatesResponse {
  /// Creates a new [GetRatesResponse] instance
  ///
  /// [rates] will be an empty list if no rates are found
  /// [success] indicates if the API request was processed successfully
  /// [errors] will be present with details if success is false
  const GetRatesResponse({
    required this.rates,
    required this.success,
    this.errors,
  });

  /// Factory constructor for creating a [GetRatesResponse] instance from JSON data
  factory GetRatesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRatesResponseFromJson(json);

  /// List of available shipping rates.
  ///
  /// Constraints:
  /// - Required field
  /// - May be an empty list if no rates are found
  /// - Each item must be a valid [Rate]
  final List<Rate> rates;

  /// Whether the request was successfully submitted.
  ///
  /// Constraints:
  /// - Required field
  /// - true: Request was processed successfully (even if no rates found)
  /// - false: Request failed (check errors field for details)
  final bool success;

  /// List of detailed errors if the request failed.
  ///
  /// Constraints:
  /// - Optional field
  /// - Present only when success is false
  /// - Each item must be a valid [StarShipItError]
  final List<StarShipItError>? errors;

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => _$GetRatesResponseToJson(this);
}
