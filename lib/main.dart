import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:reinvent_driver_app/driver-screen.dart';

import 'models/ModelProvider.dart';
import 'utils.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'amplifyconfiguration.dart';

part 'main.g.dart';

@riverpod
Future<List<Order?>> getListOfOrders(GetListOfOrdersRef ref) async {
  try {
    final request = ModelQueries.list(Order.classType,
        where: Order.CUSTOMERID.eq('sub:67f2749b-2780-40ac-be5d-90e0863295d0'));
    final response = await Amplify.API.query(request: request).response;

    final orders = response.data?.items;
    if (orders == null) {
      safePrint('errors: ${response.errors}');
      return <Order?>[];
    }
    return <Order?>[];
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
    logger.e('Amplify configuration failed.');
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
