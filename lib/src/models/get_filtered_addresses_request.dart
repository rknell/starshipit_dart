import 'package:json_annotation/json_annotation.dart';

/// Available sort columns for address book filtering
enum AddressBookSortColumn {
  /// No sorting
  @JsonValue('None')
  none,

  /// Sort by contact name
  @JsonValue('Name')
  name,

  /// Sort by company name
  @JsonValue('Company')
  company,

  /// Sort by street address
  @JsonValue('Street')
  street,

  /// Sort by suburb/locality
  @JsonValue('Suburb')
  suburb,

  /// Sort by postal code
  @JsonValue('PostCode')
  postCode,

  /// Sort by city
  @JsonValue('City')
  city,

  /// Sort by state
  @JsonValue('State')
  state,

  /// Sort by country
  @JsonValue('Country')
  country,

  /// Sort by internal code
  @JsonValue('Code')
  code,

  /// Sort by phone number
  @JsonValue('Phone')
  phone,

  /// Sort by email address
  @JsonValue('Email')
  email,
}

/// Available sort directions for address book filtering
enum AddressBookSortDirection {
  /// No sorting
  @JsonValue('None')
  none,

  /// Sort in ascending order
  @JsonValue('Ascending')
  ascending,

  /// Sort in descending order
  @JsonValue('Descending')
  descending,
}

/// Request wrapper for the Get Filtered Addresses endpoint
/// ```
/// Parameter        Type        Description
/// page            integer     Which page of the address book to return
/// page_size       integer     Number of records per page
/// sort            string      Sort by column. Available values: None, Name, Company, Street, Suburb, PostCode, City, State, Country, Code, Phone, Email
/// sort_direction  string      Sort direction for the sort column. Available values: None, Ascending, Descending
/// ```
class GetFilteredAddressesRequest {
  /// Creates a new get filtered addresses request instance
  GetFilteredAddressesRequest({
    this.page,
    this.pageSize,
    this.sort,
    this.sortDirection,
  });

  /// Which page of the address book to return
  final int? page;

  /// Number of records per page
  final int? pageSize;

  /// Sort by column
  final AddressBookSortColumn? sort;

  /// Sort direction for the sort column
  final AddressBookSortDirection? sortDirection;

  /// Converts the request to query parameters
  Map<String, String> toQueryParameters() {
    final params = <String, String>{};

    if (page != null) {
      params['page'] = page.toString();
    }
    if (pageSize != null) {
      params['page_size'] = pageSize.toString();
    }
    if (sort != null) {
      params['sort'] = sort.toString().split('.').last;
    }
    if (sortDirection != null) {
      params['sort_direction'] = sortDirection.toString().split('.').last;
    }

    return params;
  }
}
