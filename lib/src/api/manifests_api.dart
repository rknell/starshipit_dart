import 'package:http/http.dart' as http;
import 'dart:convert';

import '../exceptions.dart';
import '../models/models.dart';

/// Handles all manifest-related API requests
class ManifestsApi {
  /// Creates a new manifests API instance
  ManifestsApi({
    required String baseUrl,
    required Map<String, String> headers,
    required http.Client client,
  })  : _baseUrl = baseUrl,
        _headers = headers,
        _client = client;

  final String _baseUrl;
  final Map<String, String> _headers;
  final http.Client _client;

  /// Retrieves a list of manifests
  ///
  /// Results are ordered by date in descending order.
  /// [request] Optional request parameters for pagination
  /// Returns a [GetManifestsResponse] containing the matching manifests
  Future<GetManifestsResponse> getManifests(
      [GetManifestsRequest? request]) async {
    final uri = Uri.parse('$_baseUrl/api/manifests').replace(
      queryParameters: request?.toQueryParameters(),
    );

    final response = await _client.get(uri, headers: _headers);

    final data = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return GetManifestsResponse.fromJson(data);
    }

    throw StarShipItException(
      'Failed to get manifests: ${response.statusCode} ${response.reasonPhrase}',
    );
  }

  /// Retrieves a list of manifest files by manifest ID
  ///
  /// [manifestId] The unique numeric identifier for the manifest
  /// Returns a [GetManifestFilesResponse] containing the manifest files
  Future<GetManifestFilesResponse> getManifestFiles(int manifestId) async {
    final uri = Uri.parse('$_baseUrl/api/manifests/files/').replace(
      queryParameters: {'manifest_id': manifestId.toString()},
    );

    final response = await _client.get(uri, headers: _headers);

    final data = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return GetManifestFilesResponse.fromJson(data);
    }

    throw StarShipItException(
      'Failed to get manifest files: ${response.statusCode} ${response.reasonPhrase}',
    );
  }

  /// Creates a manifest for the specified shipments
  ///
  /// [request] The request containing tracking numbers or order numbers
  /// Returns a [ManifestShipmentsResponse] containing the manifest PDF
  Future<ManifestShipmentsResponse> manifestShipments(
      ManifestShipmentsRequest request) async {
    final uri = Uri.parse('$_baseUrl/api/manifests/shipments');

    final response = await _client.post(
      uri,
      headers: _headers,
      body: json.encode(request.toJson()),
    );

    final data = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return ManifestShipmentsResponse.fromJson(data);
    }

    throw StarShipItException(
      'Failed to manifest shipments: ${response.statusCode} ${response.reasonPhrase}',
    );
  }

  /// Manifests all relevant records for a given carrier that are ready to be shipped
  ///
  /// [request] The request containing the carrier to manifest shipments for
  /// Returns a [ManifestByCarrierResponse] containing the number of records manifested
  Future<ManifestByCarrierResponse> manifestByCarrier(
      ManifestByCarrierRequest request) async {
    final uri = Uri.parse('$_baseUrl/api/manifests/carrier');

    final response = await _client.post(
      uri,
      headers: _headers,
      body: json.encode(request.toJson()),
    );

    final data = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return ManifestByCarrierResponse.fromJson(data);
    }

    throw StarShipItException(
      'Failed to manifest by carrier: ${response.statusCode} ${response.reasonPhrase}',
    );
  }
}
