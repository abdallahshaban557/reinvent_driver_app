import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainDriverScreen extends StatefulWidget {
  const MainDriverScreen({super.key});

  @override
  State<MainDriverScreen> createState() => _MainDriverScreenState();
}

class _MainDriverScreenState extends State<MainDriverScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Driver App'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.delivery_dining)),
                Tab(icon: Icon(Icons.wallet)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Car')),
              Center(child: Text('Transit')),
            ],
          ),
        ));
  }
}
