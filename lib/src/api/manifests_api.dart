import 'package:http/http.dart' as http;
import 'dart:convert';

import '../exceptions.dart';
import '../models/models.dart';
import 'starshipit_http_client.dart';

/// Handles all manifest-related API requests
///
/// All endpoints require the following headers:
/// - Content-Type: application/json
/// - StarShipIT-Api-Key: API key from Settings > API > API Key
/// - Ocp-Apim-Subscription-Key: Subscription key from Settings > API > Subscription key
class ManifestsApi {
  /// Creates a new manifests API instance
  ManifestsApi({
    required this.httpClient,
  });

  final StarshipitHttpClient httpClient;

  /// Retrieve a list of manifests. Results are ordered by date in descending order.
  ///
  /// Endpoint: GET /api/manifests
  ///
  /// See [GetManifestsRequest] for available request parameters:
  /// - page (optional): Page to show. Default: 1
  /// - limit (optional): Maximum number of records in the result. Default: 50. Maximum: 250
  ///
  /// See [GetManifestsResponse] for response details:
  /// - manifests: List of manifest records ([Manifest] model)
  /// - success: Whether the request was successful
  /// - errors: Optional list of errors
  /// - total_pages: Total number of pages containing records
  /// - total_count: Total number of manifest records
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
  /// Endpoint: GET /api/manifests/files/
  ///
  /// See [GetManifestFilesRequest] for request parameters:
  /// - manifest_id (required): The unique numeric identifier for the manifest
  ///
  /// See [GetManifestFilesResponse] for response details:
  /// - files: List of manifest files with file_name and file_data (base64 PDF)
  /// - success: Whether the request was successful
  /// - errors: Optional list of errors if request failed
  Future<GetManifestFilesResponse> getManifestFiles(int manifestId) async {
    final json = await httpClient.get(
      '/api/manifests/files/',
      queryParameters: {'manifest_id': manifestId.toString()},
    );
    return GetManifestFilesResponse.fromJson(json);
  }

  /// Retrieve a list of shipment ids based on the tracking numbers or order numbers that have been supplied.
  /// These ids can be passed as a parameter to the manifest orders endpoint.
  ///
  /// Endpoint: POST /api/manifests/shipments
  ///
  /// See [ManifestShipmentsRequest] for request parameters:
  /// - tracking_numbers: List of tracking numbers or order numbers for shipments to be included in the manifest
  /// - use_order_numbers: Indicates if the tracking_numbers parameter contains tracking numbers or order numbers
  ///
  /// See [ManifestShipmentsResponse] for response details:
  /// - pdf: The pdf of the manifest file created
  /// - file_name: Description of the pdf file returned
  /// - success: Whether the request was successful
  /// - errors: Optional list of errors if request failed
  Future<ManifestShipmentsResponse> manifestOrders(
      ManifestShipmentsRequest request) async {
    final json = await httpClient.post(
      '/api/manifests/shipments',
      body: request.toJson(),
    );
    return ManifestShipmentsResponse.fromJson(json);
  }

  /// Manifests all relevant records for a given carrier that are ready to be shipped
  ///
  /// Endpoint: POST /api/manifests/carrier
  ///
  /// See [ManifestByCarrierRequest] for request parameters:
  /// - carrier (required): The string representation of the carrier enum value for the selected carrier
  ///
  /// See [ManifestByCarrierResponse] for response details:
  /// - records_manifested: The count of shipments that have been manifested as a result of this request
  /// - success: Whether the request was successful
  /// - errors: Optional list of errors if request failed
  Future<ManifestByCarrierResponse> manifestByCarrier(
      ManifestByCarrierRequest request) async {
    final json = await httpClient.post(
      '/api/manifests/carrier',
      body: request.toJson(),
    );
    return ManifestByCarrierResponse.fromJson(json);
  }
}
