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

  /// Gets shipping rates for a given shipment
  ///
  /// [request] The rate request containing sender, destination, and package details
  /// Returns a [RateResponse] containing available shipping rates
  Future<RateResponse> getRates(RateRequest request) async {
    final json = await httpClient.post(
      '/api/rates',
      body: request.toJson(),
    );
    return RateResponse.fromJson(json);
  }
}
