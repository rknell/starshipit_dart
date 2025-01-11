import 'package:http/http.dart' as http;
import 'dart:convert';

import '../exceptions.dart';
import '../models/models.dart';

/// Handles all rate-related API requests
class RatesApi {
  /// Creates a new rates API instance
  RatesApi({
    required String baseUrl,
    required Map<String, String> headers,
    required http.Client client,
  })  : _baseUrl = baseUrl,
        _headers = headers,
        _client = client;

  final String _baseUrl;
  final Map<String, String> _headers;
  final http.Client _client;

  /// Gets shipping rates for a given shipment
  ///
  /// [request] The rate request containing sender, destination, and package details
  /// Returns a [RateResponse] containing available shipping rates
  Future<RateResponse> getRates(RateRequest request) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl/api/rates'),
      headers: _headers,
      body: json.encode(request.toJson()),
    );

    final data = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return RateResponse.fromJson(data);
    }

    throw StarShipItException(
      'Failed to get rates: ${response.statusCode} ${response.reasonPhrase}',
    );
  }

  /// Gets a list of available carrier delivery services
  ///
  /// [request] The delivery services request containing order details
  /// Returns a [DeliveryServicesResponse] containing available delivery services
  Future<DeliveryServicesResponse> getDeliveryServices(
    DeliveryServicesRequest request,
  ) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl/api/deliveryservices'),
      headers: _headers,
      body: json.encode(request.toJson()),
    );

    final data = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return DeliveryServicesResponse.fromJson(data);
    }

    throw StarShipItException(
      'Failed to get delivery services: ${response.statusCode} ${response.reasonPhrase}',
    );
  }
}
