import 'package:http/http.dart' as http;
import 'dart:convert';

import '../exceptions.dart';
import '../models/models.dart';
import 'starshipit_http_client.dart';

/// Handles all rate-related API requests
class RatesApi {
  /// Creates a new rates API instance
  RatesApi({
    required this.httpClient,
  });

  final StarshipitHttpClient httpClient;

  /// Gets shipping rates for a given shipment.
  ///
  /// Makes a POST request to `/api/rates` to get available shipping rates.
  ///
  /// Required headers:
  /// - Content-Type: application/json
  /// - StarShipIT-Api-Key: API key from Settings > API > API Key
  /// - Ocp-Apim-Subscription-Key: Subscription key from Settings > API > Subscription key
  ///
  /// Parameters:
  /// - [request]: The [GetRatesRequest] containing:
  ///   - sender (optional): Sender address details. If not provided, pickup address from Settings is used
  ///   - destination: Required shipping address details
  ///   - packages: List of packages with weight and dimensions
  ///   - currency (optional): Currency code for the order value (max length: 3) e.g. AUD
  ///
  /// Returns a [GetRatesResponse] containing:
  /// - rates: List of available shipping rates with service details and prices
  /// - success: Whether the request was successful
  /// - errors: List of detailed errors if the request failed
  ///
  /// Example:
  /// ```dart
  /// final request = GetRatesRequest(
  ///   destination: RateAddress(
  ///     street: '20 Liverpool Street',
  ///     suburb: 'Paddington',
  ///     city: 'Sydney',
  ///     state: 'NSW',
  ///     postCode: '2021',
  ///     countryCode: 'AU',
  ///   ),
  ///   packages: [
  ///     RatePackage(weight: 0.5),
  ///   ],
  /// );
  /// final response = await ratesApi.getRates(request);
  /// ```
  ///
  /// Throws a [StarShipItException] if the request fails.
  Future<GetRatesResponse> getRates(GetRatesRequest request) async {
    final json = await httpClient.post(
      '/api/rates',
      body: request.toJson(),
    );
    return GetRatesResponse.fromJson(json);
  }
}
