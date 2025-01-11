import 'package:starshipit/starshipit.dart';

void main() async {
  // Initialize the client with your API key
  final client = StarShipItClient(
    apiKey: 'your_api_key_here',
  );

  try {
    // Example 1: List all unshipped orders from the last 24 hours (default)
    final response = await client.listUnshippedOrders();
    print('Found ${response.orders?.length ?? 0} unshipped orders');

    // Example 2: List unshipped orders with custom parameters
    final customResponse = await client.listUnshippedOrders(
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
    final idsResponse = await client.listUnshippedOrders(
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
