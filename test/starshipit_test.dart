import 'package:starshipit/starshipit.dart';
import 'package:test/test.dart';

void main() {
  group('StarShipItClient', () {
    late StarShipItClient client;

    setUp(() {
      client = StarShipItClient(apiKey: 'test_key');
    });

    tearDown(() {
      client.dispose();
    });

    test('creates client with correct headers', () {
      expect(client.headers['Content-Type'], equals('application/json'));
      expect(client.headers['Authorization'], startsWith('Bearer '));
    });
  });
}
