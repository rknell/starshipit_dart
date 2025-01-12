import 'package:test/test.dart';
import 'package:starshipit/src/api/orders_api.dart';
import '../mocks/mock_starshipit_http_client.dart';

void main() {
  late OrdersApi ordersApi;
  late MockStarshipitHttpClient mockClient;
  late String capturedEndpoint;

  setUp(() {
    capturedEndpoint = '';
    mockClient = MockStarshipitHttpClient(
      onRequest: (endpoint, {queryParameters, body}) {
        capturedEndpoint = endpoint;
      },
    );
    ordersApi = OrdersApi(httpClient: mockClient);
  });

  group('OrdersApi endpoints', () {
    test('listUnshipped hits correct endpoint', () async {
      await ordersApi.listUnshipped();
      expect(capturedEndpoint, '/api/orders/unshipped');
    });

    test('listShipped hits correct endpoint', () async {
      await ordersApi.listShipped();
      expect(capturedEndpoint, '/api/orders/shipped');
    });

    test('search hits correct endpoint', () async {
      await ordersApi.search();
      expect(capturedEndpoint, '/api/orders/search');
    });

    test('getOrder hits correct endpoint', () async {
      await ordersApi.getOrder('123');
      expect(capturedEndpoint, '/api/orders/123');
    });

    test('deleteOrder hits correct endpoint', () async {
      await ordersApi.deleteOrder('123');
      expect(capturedEndpoint, '/api/orders/123');
    });

    test('archiveOrder hits correct endpoint', () async {
      await ordersApi.archiveOrder('123');
      expect(capturedEndpoint, '/api/orders/123/archive');
    });

    test('restoreOrder hits correct endpoint', () async {
      await ordersApi.restoreOrder('123');
      expect(capturedEndpoint, '/api/orders/123/restore');
    });
  });
}
