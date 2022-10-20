import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:reinvent_driver_app/features/driver_app_files/ui/main_driver_screen.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({
    required this.isAmplifySuccessfullyConfigured,
    Key? key,
  }) : super(key: key);

  final bool isAmplifySuccessfullyConfigured;

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
        home: isAmplifySuccessfullyConfigured
            ? const Scaffold(body: SafeArea(child: MainDriverScreen()))
            : const Scaffold(
                body: Center(
                  child: Text(
                    'Tried to reconfigure Amplify; '
                    'this can occur when your app restarts on Android.',
                  ),
                ),
              ),
      ),
    );
  }
}
