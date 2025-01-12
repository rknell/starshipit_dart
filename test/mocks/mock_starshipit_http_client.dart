import 'package:http/http.dart' as http;
import 'package:starshipit/src/api/starshipit_http_client.dart';
import 'package:starshipit/src/exceptions.dart';
import 'dart:convert';

class MockStarshipitHttpClient implements StarshipitHttpClient {
  final List<String> validEndpoints = [
    '/api/orders/unshipped',
    '/api/orders/shipments',
    '/api/orders/shipped',
    '/api/orders/delivered',
    '/api/orders/search',
    '/api/orders',
    '/api/orders/update',
    '/api/orders/batchupdate',
    '/api/orders/delete',
    '/api/orders/archive',
    '/api/deliveryservices',
    '/api/addressbook',
    '/api/addressbook/validate',
    '/api/addressbook/suggest',
    '/api/addressbook/countries',
    '/api/couriers',
    '/api/couriers/validate',
    '/api/couriers/accounts',
    '/api/couriers/services',
    '/api/labels',
    '/api/labels/rates',
    '/api/labels/print',
    '/api/labels/validate',
    '/api/manifests',
    '/api/manifests/create',
    '/api/manifests/files',
    '/api/manifests/generate',
    '/api/manifests/print',
    '/api/products/sku',
    '/api/products/suggest',
    '/api/products',
    '/api/returns/create',
    '/api/returns/reasons',
    '/api/track',
    '/api/webhooks',
    '/api/webhooks/test'
  ];

  final Map<String, dynamic> Function(String endpoint,
      {Map<String, String>? queryParameters})? mockResponseBuilder;
  final void Function(String endpoint,
      {Map<String, String>? queryParameters, Object? body})? onRequest;

  MockStarshipitHttpClient({
    this.mockResponseBuilder,
    this.onRequest,
  });

  @override
  String get apiKey => 'mock-api-key';

  @override
  String get baseUrl => 'https://api.starshipit.com';

  @override
  String get subscriptionKey => 'mock-subscription-key';

  void _validateEndpoint(String endpoint) {
    final cleanEndpoint = endpoint.split('?').first;
    if (!validEndpoints.contains(cleanEndpoint)) {
      throw StarShipItException(
        jsonEncode({
          'error': {
            'code': 404,
            'message': 'Not Found',
            'details':
                'Invalid endpoint: $cleanEndpoint. This endpoint is not in the list of valid endpoints.'
          }
        }),
      );
    }
  }

  Map<String, dynamic> _getResponse(String endpoint,
      {Map<String, String>? queryParameters}) {
    if (mockResponseBuilder != null) {
      return mockResponseBuilder!(endpoint, queryParameters: queryParameters);
    }
    return {'success': true};
  }

  @override
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    _validateEndpoint(endpoint);
    onRequest?.call(endpoint, queryParameters: queryParameters);
    return _getResponse(endpoint, queryParameters: queryParameters);
  }

  @override
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Object? body,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    _validateEndpoint(endpoint);
    onRequest?.call(endpoint, queryParameters: queryParameters, body: body);
    return _getResponse(endpoint, queryParameters: queryParameters);
  }

  @override
  Future<Map<String, dynamic>> put(
    String endpoint, {
    Object? body,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    _validateEndpoint(endpoint);
    onRequest?.call(endpoint, queryParameters: queryParameters, body: body);
    return _getResponse(endpoint, queryParameters: queryParameters);
  }

  @override
  Future<Map<String, dynamic>> delete(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    _validateEndpoint(endpoint);
    onRequest?.call(endpoint, queryParameters: queryParameters);
    return _getResponse(endpoint, queryParameters: queryParameters);
  }

  @override
  void dispose() {}
}
