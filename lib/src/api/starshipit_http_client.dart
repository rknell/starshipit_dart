import 'dart:convert';
import 'package:http/http.dart' as http;

import '../exceptions.dart';

/// A base HTTP client for making authenticated requests to the StarShipIT API
class StarshipitHttpClient {
  /// Creates a new [StarshipitHttpClient] instance
  ///
  /// [apiKey] is your StarShipIT API key
  /// [subscriptionKey] is your StarShipIT subscription key
  /// [baseUrl] is the base URL for the StarShipIT API (defaults to https://api.starshipit.com)
  StarshipitHttpClient({
    required this.apiKey,
    required this.subscriptionKey,
    this.baseUrl = 'https://api.starshipit.com',
  }) : _client = http.Client();

  final String baseUrl;
  final String apiKey;
  final String subscriptionKey;
  final http.Client _client;

  /// The default headers used for API requests
  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'StarShipIT-Api-Key': apiKey,
        'Ocp-Apim-Subscription-Key': subscriptionKey,
      };

  /// Merges the default headers with optional additional headers
  Map<String, String> _mergeHeaders([Map<String, String>? additionalHeaders]) {
    if (additionalHeaders == null) return _headers;
    return {..._headers, ...additionalHeaders};
  }

  /// Handles response errors and returns decoded JSON if successful
  Map<String, dynamic> _handleResponse(http.Response response) {
    final body = jsonDecode(response.body) as Map<String, dynamic>;

    // Check for error in response body
    if (body.containsKey('error')) {
      throw StarShipItException(body['error'].toString());
    }

    // Check for non-2xx status code
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw StarShipItException(
        'Request failed with status: ${response.statusCode} ${response.reasonPhrase}',
      );
    }

    return body;
  }

  /// Performs a GET request to the specified endpoint
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    var uri = Uri.parse('$baseUrl$endpoint');
    if (queryParameters != null) {
      uri = uri.replace(
          queryParameters: {...uri.queryParameters, ...queryParameters});
    }
    final response = await _client.get(uri, headers: _mergeHeaders(headers));
    return _handleResponse(response);
  }

  /// Performs a POST request to the specified endpoint with optional body
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Object? body,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    var uri = Uri.parse('$baseUrl$endpoint');
    if (queryParameters != null) {
      uri = uri.replace(
          queryParameters: {...uri.queryParameters, ...queryParameters});
    }
    final response = await _client.post(
      uri,
      headers: _mergeHeaders(headers),
      body: body != null ? jsonEncode(body) : null,
    );
    return _handleResponse(response);
  }

  /// Performs a PUT request to the specified endpoint with optional body
  Future<Map<String, dynamic>> put(
    String endpoint, {
    Object? body,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    var uri = Uri.parse('$baseUrl$endpoint');
    if (queryParameters != null) {
      uri = uri.replace(
          queryParameters: {...uri.queryParameters, ...queryParameters});
    }
    final response = await _client.put(
      uri,
      headers: _mergeHeaders(headers),
      body: body != null ? jsonEncode(body) : null,
    );
    return _handleResponse(response);
  }

  /// Performs a DELETE request to the specified endpoint
  Future<Map<String, dynamic>> delete(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    var uri = Uri.parse('$baseUrl$endpoint');
    if (queryParameters != null) {
      uri = uri.replace(
          queryParameters: {...uri.queryParameters, ...queryParameters});
    }
    final response = await _client.delete(uri, headers: _mergeHeaders(headers));
    return _handleResponse(response);
  }

  /// Closes the client and frees up resources
  void dispose() {
    _client.close();
  }
}
