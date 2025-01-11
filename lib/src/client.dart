import 'package:http/http.dart' as http;
import 'api/orders_api.dart';
import 'api/shipping_api.dart';
import 'api/tracking_api.dart';

/// The main client for interacting with the StarShipIT API
class StarShipItClient {
  final String _baseUrl;
  final http.Client _client;
  final OrdersApi _orders;
  final ShippingApi _shipping;
  final TrackingApi _tracking;

  /// Creates a new [StarShipItClient] instance
  ///
  /// [apiKey] is your StarShipIT API key
  /// [baseUrl] is the base URL for the StarShipIT API (defaults to https://api.starshipit.com)
  StarShipItClient({
    required String apiKey,
    String baseUrl = 'https://api.starshipit.com',
  })  : _baseUrl = baseUrl,
        _client = http.Client(),
        _orders = OrdersApi(
          baseUrl,
          {'Content-Type': 'application/json', 'StarShipIT-Api-Key': apiKey},
          http.Client(),
        ),
        _shipping = ShippingApi(
          baseUrl,
          {'Content-Type': 'application/json', 'StarShipIT-Api-Key': apiKey},
          http.Client(),
        ),
        _tracking = TrackingApi(
          baseUrl,
          {'Content-Type': 'application/json', 'StarShipIT-Api-Key': apiKey},
          http.Client(),
        );

  /// Access order-related API endpoints
  OrdersApi get orders => _orders;

  /// Access shipping-related API endpoints
  ShippingApi get shipping => _shipping;

  /// Access tracking-related API endpoints
  TrackingApi get tracking => _tracking;

  /// Closes the client and frees up resources
  void dispose() {
    _client.close();
  }
}
