import 'package:http/http.dart' as http;
import 'dart:convert';

import '../exceptions.dart';
import '../models/models.dart';

/// Handles all address book-related API requests
class AddressBookApi {
  /// Creates a new address book API instance
  AddressBookApi({
    required String baseUrl,
    required Map<String, String> headers,
    required http.Client client,
  })  : _baseUrl = baseUrl,
        _headers = headers,
        _client = client;

  final String _baseUrl;
  final Map<String, String> _headers;
  final http.Client _client;

  /// Gets a filtered list of addresses from the address book
  ///
  /// [request] Optional request parameters for filtering and pagination
  /// Returns a [GetFilteredAddressesResponse] containing the matching addresses
  Future<GetFilteredAddressesResponse> getFilteredAddresses([
    GetFilteredAddressesRequest? request,
  ]) async {
    final uri = Uri.parse('$_baseUrl/api/addressbook/filtered').replace(
      queryParameters: request?.toQueryParameters(),
    );

    final response = await _client.get(uri, headers: _headers);

    final data = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return GetFilteredAddressesResponse.fromJson(data);
    }

    throw StarShipItException(
      'Failed to get filtered addresses: ${response.statusCode} ${response.reasonPhrase}',
    );
  }

  /// Deletes addresses from the address book
  ///
  /// [request] The request containing the list of address IDs to delete
  /// Returns a [DeleteAddressResponse] indicating success or failure
  Future<DeleteAddressResponse> deleteAddresses(
      DeleteAddressRequest request) async {
    final uri = Uri.parse('$_baseUrl/api/addressbook/delete');

    final response = await _client.post(
      uri,
      headers: _headers,
      body: json.encode(request.toJson()),
    );

    final data = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return DeleteAddressResponse.fromJson(data);
    }

    throw StarShipItException(
      'Failed to delete addresses: ${response.statusCode} ${response.reasonPhrase}',
    );
  }

  /// Updates address information for a saved contact
  ///
  /// [request] The request containing the address ID and updated details
  /// Returns an [UpdateAddressResponse] containing the updated address information
  Future<UpdateAddressResponse> updateAddress(
      UpdateAddressRequest request) async {
    final uri = Uri.parse('$_baseUrl/api/addressbook/update');

    final response = await _client.post(
      uri,
      headers: _headers,
      body: json.encode(request.toJson()),
    );

    final data = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return UpdateAddressResponse.fromJson(data);
    }

    throw StarShipItException(
      'Failed to update address: ${response.statusCode} ${response.reasonPhrase}',
    );
  }

  /// Saves address information for a new contact
  ///
  /// [request] The request containing the new address details
  /// Returns an [AddAddressResponse] containing the new address information and ID
  Future<AddAddressResponse> addAddress(AddAddressRequest request) async {
    final uri = Uri.parse('$_baseUrl/api/addressbook/');

    final response = await _client.post(
      uri,
      headers: _headers,
      body: json.encode(request.toJson()),
    );

    final data = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return AddAddressResponse.fromJson(data);
    }

    throw StarShipItException(
      'Failed to add address: ${response.statusCode} ${response.reasonPhrase}',
    );
  }
}
