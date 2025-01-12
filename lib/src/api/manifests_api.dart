import 'package:http/http.dart' as http;
import 'dart:convert';

import '../exceptions.dart';
import '../models/models.dart';
import 'starshipit_http_client.dart';

/// Handles all manifest-related API requests
class ManifestsApi {
  /// Creates a new manifests API instance
  ManifestsApi({
    required this.httpClient,
  });

  final StarshipitHttpClient httpClient;

  /// Retrieves a list of manifests
  ///
  /// Results are ordered by date in descending order.
  /// [request] Optional request parameters for pagination
  /// Returns a [GetManifestsResponse] containing the matching manifests
  Future<GetManifestsResponse> getManifests(
      [GetManifestsRequest? request]) async {
    final json = await httpClient.get(
      '/api/manifests',
      queryParameters: request?.toQueryParameters(),
    );
    return GetManifestsResponse.fromJson(json);
  }

  /// Retrieves a list of manifest files by manifest ID
  ///
  /// [manifestId] The unique numeric identifier for the manifest
  /// Returns a [GetManifestFilesResponse] containing the manifest files
  Future<GetManifestFilesResponse> getManifestFiles(int manifestId) async {
    final json = await httpClient.get(
      '/api/manifests/files/',
      queryParameters: {'manifest_id': manifestId.toString()},
    );
    return GetManifestFilesResponse.fromJson(json);
  }

  /// Creates a manifest for the specified shipments
  ///
  /// [request] The request containing tracking numbers or order numbers
  /// Returns a [ManifestShipmentsResponse] containing the manifest PDF
  Future<ManifestShipmentsResponse> manifestShipments(
      ManifestShipmentsRequest request) async {
    final json = await httpClient.post(
      '/api/manifests/shipments',
      body: request.toJson(),
    );
    return ManifestShipmentsResponse.fromJson(json);
  }

  /// Manifests all relevant records for a given carrier that are ready to be shipped
  ///
  /// [request] The request containing the carrier to manifest shipments for
  /// Returns a [ManifestByCarrierResponse] containing the number of records manifested
  Future<ManifestByCarrierResponse> manifestByCarrier(
      ManifestByCarrierRequest request) async {
    final json = await httpClient.post(
      '/api/manifests/carrier',
      body: request.toJson(),
    );
    return ManifestByCarrierResponse.fromJson(json);
  }
}
