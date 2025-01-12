import 'package:http/http.dart' as http;
import 'dart:convert';

import '../exceptions.dart';
import '../models/models.dart';
import 'starshipit_http_client.dart';

/// Handles all address book-related API requests
class AddressBookApi {
  /// Creates a new address book API instance
  AddressBookApi({
    required this.httpClient,
  });

  final StarshipitHttpClient httpClient;

  /// Gets a filtered list of addresses from the address book
  ///
  /// [request] Optional request parameters for filtering and pagination
  /// Returns a [GetFilteredAddressesResponse] containing the matching addresses
  Future<GetFilteredAddressesResponse> getFilteredAddresses([
    GetFilteredAddressesRequest? request,
  ]) async {
    final json = await httpClient.get(
      '/api/addressbook/filtered',
      queryParameters: request?.toQueryParameters(),
    );
    return GetFilteredAddressesResponse.fromJson(json);
  }

  /// Deletes addresses from the address book
  ///
  /// [request] The request containing the list of address IDs to delete
  /// Returns a [DeleteAddressResponse] indicating success or failure
  Future<DeleteAddressResponse> deleteAddresses(
      DeleteAddressRequest request) async {
    final json = await httpClient.post(
      '/api/addressbook/delete',
      body: request.toJson(),
    );
    return DeleteAddressResponse.fromJson(json);
  }

  /// Updates address information for a saved contact
  ///
  /// [request] The request containing the address ID and updated details
  /// Returns an [UpdateAddressResponse] containing the updated address information
  Future<UpdateAddressResponse> updateAddress(
      UpdateAddressRequest request) async {
    final json = await httpClient.post(
      '/api/addressbook/update',
      body: request.toJson(),
    );
    return UpdateAddressResponse.fromJson(json);
  }

  /// Saves address information for a new contact
  ///
  /// [request] The request containing the new address details
  /// Returns an [AddAddressResponse] containing the new address information and ID
  Future<AddAddressResponse> addAddress(AddAddressRequest request) async {
    final json = await httpClient.post(
      '/api/addressbook/',
      body: request.toJson(),
    );
    return AddAddressResponse.fromJson(json);
  }
}
