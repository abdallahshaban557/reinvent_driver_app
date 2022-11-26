import 'dart:async';

import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'OrderDetailsScreen.dart';
import 'features/driver_app_files/ui/main_driver_screen.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:amplify_api/amplify_api.dart';
import 'models/ModelProvider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'amplifyconfiguration.dart';

part 'main.g.dart';

Future<void> _configureAmplify() async {
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
    AmplifyAPI(modelProvider: ModelProvider.instance),
  ]);
  await Amplify.configure(amplifyconfig);
}

//stream with updates
@riverpod
Stream<GraphQLResponse<Order>> subscribe(SubscribeRef ref) {
  final Stream<GraphQLResponse<Order>> operation = Amplify.API
      .subscribe(
    GraphQLRequest<Order>(
      document: r'''
subscription MySubscription {
  onCreateOrder(driver: "abdallahshaban") {
    createdAt
    driver
    id
    orderID
    orderstatus
    ordertotal
  }
}

''',
      decodePath: 'onCreateOrder',
      modelType: Order.classType,
    ),
    onEstablished: () => safePrint('Subscription established'),
  )
      .handleError(
    (error) {
      safePrint('Error in subscription stream: $error');
    },
  );

  return operation;
}

//combining two providers
@riverpod
Future<List<Order?>> combinedOrderList(CombinedOrderListRef ref) async {
  List<Order?> listOfOrdersList = [];

  final initiallistOfOrders = ref.watch(getListOfAssignedOrdersProvider);
  initiallistOfOrders.when(
      data: ((data) {
        listOfOrdersList = data;
      }),
      error: (error, stackTrace) => safePrint("issue"),
      loading: () {});

  final streamUpdates = ref.watch(subscribeProvider);
  streamUpdates.listen((event) {
    listOfOrdersList.add(event.data);
  });

  return listOfOrdersList;
}

@riverpod
Stream<List<Order>> subscribed(SubscribedRef ref) {
  final controller = StreamController<List<Order>>();
  final initialOrders = ref.watch(getListOfAssignedOrdersProvider);

  final allOrders = <Order>[];
  initialOrders.when(
    loading: () {
      safePrint('loading');
    },
    data: (data) {
      allOrders.addAll(data.whereType<Order>());
      controller.add(allOrders);
    },
    error: controller.addError,
  );

  final streamUpdates = ref.watch(subscribeProvider);
  streamUpdates.listen((event) {
    final order = event.data;
    safePrint("testing");
    if (order != null) {
      allOrders.add(order);
      controller.add(allOrders);
    } else {
      controller.addError(event.errors);
    }
  });

  return controller.stream;
}

@riverpod
Future<List<Order?>> getListOfOrders(GetListOfOrdersRef ref) async {
  try {
    final userDetails = await Amplify.Auth.getCurrentUser();
    final username = userDetails.username;
    final predicate =
        Order.DRIVER.eq(username).and(Order.ORDERSTATUS.eq('COMPLETED'));
    final request = ModelQueries.list(Order.classType, where: predicate);
    //final request = ModelQueries.list(Order.classType);
    final response = await Amplify.API.query(request: request).response;

    final orders = response.data?.items;
    if (orders == null) {
      return <Order?>[];
    }
    return orders;
  } on ApiException catch (e) {
    safePrint('Query failed: $e');
  }
  return <Order?>[];
}

@riverpod
Future<List<Order?>> getListOfAssignedOrders(
    GetListOfAssignedOrdersRef ref) async {
  try {
    final userDetails = await Amplify.Auth.getCurrentUser();
    final username = userDetails.username;
    final predicate = Order.DRIVER.eq(username).and(
          Order.ORDERSTATUS.eq('INPROGRESS').or(
                Order.ORDERSTATUS.eq('ONROUTE').or(
                      Order.ORDERSTATUS.eq('NEW'),
                    ),
              ),
        );
    final request = ModelQueries.list(Order.classType, where: predicate);
    //final request = ModelQueries.list(Order.classType);
    final response = await Amplify.API.query(request: request).response;

    final orders = response.data?.items;
    if (orders == null) {
      return <Order?>[];
    }
    return orders;
  } on ApiException catch (e) {
    safePrint('Query failed: $e');
  }
  return <Order?>[];
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isAmplifySuccessfullyConfigured = false;
  try {
    await _configureAmplify();
    isAmplifySuccessfullyConfigured = true;
  } on AmplifyAlreadyConfiguredException {
    safePrint('Amplify configuration failed.');
  }

  runApp(
    ProviderScope(
      child: Authenticator(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
              titleLarge: TextStyle(fontSize: 20),
              titleMedium: TextStyle(fontSize: 15),
              titleSmall: TextStyle(fontSize: 10),
              headlineMedium: TextStyle(
                fontSize: 30.0,
              ),
              bodySmall: TextStyle(
                fontSize: 36.0,
                fontFamily: 'Hind',
              ),
              bodyLarge: TextStyle(
                fontSize: 36.0,
                fontFamily: 'Hind',
              ),
            ),
          ),
          initialRoute: '/',
          routes: {
            '/orderDetails': (context) => const OrderDetailsScreen(),
          },
          builder: Authenticator.builder(),
          home: isAmplifySuccessfullyConfigured
              ? const Scaffold(body: MainDriverScreen())
              : const Scaffold(
                  body: Center(
                    child: Text(
                      'Tried to reconfigure Amplify; '
                      'this can occur when your app restarts on Android.',
                    ),
                  ),
                ),
        ),
      ),
    ),
  );
}
