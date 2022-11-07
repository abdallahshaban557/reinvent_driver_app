// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $getListOfOrdersHash() => r'8b9b2f06625938cb89d7762bf0458123603fadb8';

/// See also [getListOfOrders].
final getListOfOrdersProvider = AutoDisposeFutureProvider<List<Order?>>(
  getListOfOrders,
  name: r'getListOfOrdersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $getListOfOrdersHash,
);
typedef GetListOfOrdersRef = AutoDisposeFutureProviderRef<List<Order?>>;
String $getListOfAssignedOrdersHash() =>
    r'81a57c79ac47037eca2dbcaf01fddede4cedb672';

/// See also [getListOfAssignedOrders].
final getListOfAssignedOrdersProvider = AutoDisposeFutureProvider<List<Order?>>(
  getListOfAssignedOrders,
  name: r'getListOfAssignedOrdersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $getListOfAssignedOrdersHash,
);
typedef GetListOfAssignedOrdersRef = AutoDisposeFutureProviderRef<List<Order?>>;
