import 'package:http/http.dart' as http;
import 'dart:convert';

import '../exceptions.dart';
import '../models/models.dart';
import 'starshipit_http_client.dart';

/// Handles all address book-related API requests.
///
/// The address book API allows you to manage contacts and their addresses.
/// All endpoints require the following headers:
/// - Content-Type: application/json
/// - StarShipIT-Api-Key: API key from Settings > API > API Key
/// - Ocp-Apim-Subscription-Key: Subscription key from Settings > API > Subscription key
class AddressBookApi {
  /// Creates a new address book API instance
  AddressBookApi({
    required this.httpClient,
  });

  final StarshipitHttpClient httpClient;

  /// Retrieve a list of contacts that is stored in your address book.
  /// Results are sorted by specified column and returned one page at a time.
  ///
  /// Endpoint: GET /api/addressbook/filtered
  ///
  /// See [GetFilteredAddressesRequest] for available request parameters
  /// and [GetFilteredAddressesResponse] for response details.
  Future<GetFilteredAddressesResponse> getFilteredAddresses([
    GetFilteredAddressesRequest? request,
  ]) async {
    final json = await httpClient.get(
      '/api/addressbook/filtered',
      queryParameters: request?.toQueryParameters(),
    );
    return GetFilteredAddressesResponse.fromJson(json);
  }

  /// Deletes addresses from the address book.
  ///
  /// Endpoint: POST /api/addressbook/delete
  ///
  /// See [DeleteAddressRequest] for request parameters
  /// and [DeleteAddressResponse] for response details.
  Future<DeleteAddressResponse> deleteAddresses(
      DeleteAddressRequest request) async {
    final json = await httpClient.post(
      '/api/addressbook/delete',
      body: request.toJson(),
    );
    return DeleteAddressResponse.fromJson(json);
  }

  /// Updates address information for a saved contact.
  ///
  /// Endpoint: POST /api/addressbook/update
  ///
  /// See [UpdateAddressRequest] for request parameters
  /// and [UpdateAddressResponse] for response details.
  Future<UpdateAddressResponse> updateAddress(
      UpdateAddressRequest request) async {
    final json = await httpClient.post(
      '/api/addressbook/update',
      body: request.toJson(),
    );
    return UpdateAddressResponse.fromJson(json);
  }

  /// Saves address information for a new contact.
  ///
  /// Endpoint: POST /api/addressbook/
  ///
  /// See [AddAddressRequest] for request parameters
  /// and [AddAddressResponse] for response details.
  Future<AddAddressResponse> addAddress(AddAddressRequest request) async {
    final json = await httpClient.post(
      '/api/addressbook/',
      body: request.toJson(),
    );
    return AddAddressResponse.fromJson(json);
  }
}
