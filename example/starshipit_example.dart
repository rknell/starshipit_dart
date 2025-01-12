import 'dart:io';
import 'package:starshipit/starshipit.dart';

void main() async {
  // Load API keys from environment variables
  final apiKey = Platform.environment['STARSHIPIT_API_KEY'];
  final subscriptionKey = Platform.environment['STARSHIPIT_SUBSCRIPTION_KEY'];

  if (apiKey == null || subscriptionKey == null) {
    print(
        'Error: Environment variables STARSHIPIT_API_KEY and STARSHIPIT_SUBSCRIPTION_KEY must be set');
    exit(1);
  }

  // Initialize the client with your API key
  final client = StarShipItClient(
    apiKey: apiKey,
    subscriptionKey: subscriptionKey,
  );

  try {
    // Create an order that uses the plain label courier
    final request = CreateOrdersRequest(
        order: CreateOrderModel(
            orderNumber: 'TEST100',
            destination: DestinationDetails(
                name: 'Test Name',
                street: 'Test Street',
                suburb: 'Test Suburb',
                country: 'Test Country')));

    final createOrderResponse = await client.orders.create(request);
    print(createOrderResponse.order);

    // Example 1: List all unshipped orders from the last 24 hours (default)
    final response = await client.orders.listUnshipped();
    print('Found ${response.orders?.length ?? 0} unshipped orders');

    // Example 2: List unshipped orders with custom parameters
    final customResponse = await client.orders.listUnshipped(
      request: ListUnshippedOrdersRequest(
        sinceOrderDate: DateTime.now().subtract(const Duration(days: 7)),
        limit: 100,
        page: 1,
      ),
    );

    // Process the orders
    if (customResponse.orders != null) {
      for (final order in customResponse.orders!) {
        print('Order ${order.orderNumber} is ready for shipping');
      }
    }

    // Example 3: Get only order IDs for unshipped orders
    final idsResponse = await client.orders.listUnshipped(
      request: ListUnshippedOrdersRequest(
        idsOnly: true,
      ),
    );

    if (idsResponse.orderIds != null) {
      print('Unshipped order IDs: ${idsResponse.orderIds!.join(', ')}');
    }
  } on StarShipItException catch (e) {
    print('API Error: ${e.message}');
  } finally {
    // Always dispose the client when done
    client.dispose();
  }
}
