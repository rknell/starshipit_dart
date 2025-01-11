import 'package:http/http.dart' as http;
import 'api/orders_api.dart';
import 'api/shipping_api.dart';
import 'api/tracking_api.dart';
import 'api/rates_api.dart';

/// The main client for interacting with the StarShipIT API
class StarShipItClient {
  /// Creates a new [StarShipItClient] instance
  ///
  /// [apiKey] is your StarShipIT API key
  /// [baseUrl] is the base URL for the StarShipIT API (defaults to https://api.starshipit.com)
  StarShipItClient({
    required String apiKey,
    String baseUrl = 'https://api.starshipit.com',
  })  : _baseUrl = baseUrl,
        _client = http.Client(),
        _apiKey = apiKey {
    _orders = OrdersApi(
      baseUrl: baseUrl,
      headers: _headers,
      client: http.Client(),
    );
    _shipping = ShippingApi(
      baseUrl: baseUrl,
      headers: _headers,
      client: http.Client(),
    );
    _tracking = TrackingApi(
      baseUrl: baseUrl,
      headers: _headers,
      client: http.Client(),
    );
    _rates = RatesApi(
      baseUrl: baseUrl,
      headers: _headers,
      client: http.Client(),
    );
  }
  final String _baseUrl;
  final http.Client _client;
  final String _apiKey;
  late final OrdersApi _orders;
  late final ShippingApi _shipping;
  late final TrackingApi _tracking;
  late final RatesApi _rates;

  /// The default headers used for API requests
  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'StarShipIT-Api-Key': _apiKey,
      };

  /// Access order-related API endpoints
  OrdersApi get orders => _orders;

  /// Access shipping-related API endpoints
  ShippingApi get shipping => _shipping;

  /// Access tracking-related API endpoints
  TrackingApi get tracking => _tracking;

  /// Access rate-related API endpoints
  RatesApi get rates => _rates;

  /// Closes the client and frees up resources
  void dispose() {
    _client.close();
  }
}
