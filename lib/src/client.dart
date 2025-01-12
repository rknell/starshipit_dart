import 'package:starshipit/src/api/address_book_api.dart';
import 'package:starshipit/src/api/manifests_api.dart';
import 'package:starshipit/src/api/starshipit_http_client.dart';
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
    required this.apiKey,
    required this.subscriptionKey,
    this.baseUrl = 'https://api.starshipit.com',
  }) : httpClient = StarshipitHttpClient(
            apiKey: apiKey, subscriptionKey: subscriptionKey);

  final String baseUrl;
  final StarshipitHttpClient httpClient;
  final String apiKey;
  final String subscriptionKey;
  OrdersApi get orders => OrdersApi(httpClient: httpClient);
  ShippingApi get shipping => ShippingApi(httpClient: httpClient);
  TrackingApi get tracking => TrackingApi(httpClient: httpClient);
  RatesApi get rates => RatesApi(httpClient: httpClient);
  ManifestsApi get manifests => ManifestsApi(httpClient: httpClient);
  AddressBookApi get addressBook => AddressBookApi(httpClient: httpClient);

  /// Closes the client and frees up resources
  void dispose() {
    httpClient.dispose();
  }
}
