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

String $subscribeHash() => r'19ce0280803861e3bb08057ae7bd7da637192388';

/// See also [subscribe].
final subscribeProvider = AutoDisposeProvider<Stream<GraphQLResponse<Order>>>(
  subscribe,
  name: r'subscribeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $subscribeHash,
);
typedef SubscribeRef = AutoDisposeProviderRef<Stream<GraphQLResponse<Order>>>;
String $combinedOrderListHash() => r'13426dbcef4043c03023120070dae11beb0f7cf9';

/// See also [combinedOrderList].
final combinedOrderListProvider = AutoDisposeFutureProvider<List<Order?>>(
  combinedOrderList,
  name: r'combinedOrderListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $combinedOrderListHash,
);
typedef CombinedOrderListRef = AutoDisposeFutureProviderRef<List<Order?>>;
String $subscribedHash() => r'f2b52d423290f1dce98b4548b1a71a6843b2abbe';

/// See also [subscribed].
final subscribedProvider = AutoDisposeProvider<Stream<List<Order>>>(
  subscribed,
  name: r'subscribedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $subscribedHash,
);
typedef SubscribedRef = AutoDisposeProviderRef<Stream<List<Order>>>;
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
    r'07100fe0012c704471da4ee0e1acf135f2ca5554';

/// See also [getListOfAssignedOrders].
final getListOfAssignedOrdersProvider = AutoDisposeFutureProvider<List<Order?>>(
  getListOfAssignedOrders,
  name: r'getListOfAssignedOrdersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $getListOfAssignedOrdersHash,
);
typedef GetListOfAssignedOrdersRef = AutoDisposeFutureProviderRef<List<Order?>>;
