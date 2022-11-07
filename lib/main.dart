import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:reinvent_driver_app/driver-screen.dart';

import 'models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'amplifyconfiguration.dart';

part 'main.g.dart';

@riverpod
Future<List<Order?>> getListOfOrders(GetListOfOrdersRef ref) async {
  try {
    final userDetails = await Amplify.Auth.getCurrentUser();
    final username = userDetails.username;
    final predicate = Order.DRIVER.eq(username);
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
      child: DriverScreen(
        isAmplifySuccessfullyConfigured: isAmplifySuccessfullyConfigured,
      ),
    ),
  );
}

Future<void> _configureAmplify() async {
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
    AmplifyAPI(modelProvider: ModelProvider.instance),
  ]);
  await Amplify.configure(amplifyconfig);
}
