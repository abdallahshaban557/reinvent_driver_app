import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:reinvent_driver_app/main.dart';
import 'package:reinvent_driver_app/models/Order.dart';
import 'package:reinvent_driver_app/models/OrderStatus.dart';

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
          actions: <Widget>[
            //add signout button
            IconButton(
              icon: const Icon(
                Icons.login_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
                Amplify.Auth.signOut();
              },
            )
          ],
          title: const Text('Driver App'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.delivery_dining)),
              Tab(icon: Icon(Icons.wallet)),
            ],
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [AssignedViewWidget(), HistoryViewWidget()],
          ),
        ),
      ),
    );
  }
}

class HistoryViewWidget extends ConsumerWidget {
  const HistoryViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getOrders = ref.watch(getListOfOrdersProvider);
    return getOrders.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text('Error: $error'),
      data: (data) {
        safePrint(data.length);
        return ListView.separated(
          itemCount: data.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          itemBuilder: (BuildContext context, int index) {
            final DateFormat formatter = DateFormat('yyyy-MM-dd');
            //get dateTime from temporalDate
            final String formatted = formatter
                .format(DateTime.parse(data[index]!.createdAt.toString()));
            //String date = DateFormat.yMMMd().add_Hm().format(myvalue);
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(data[index]!.orderstatus.toString().split('.')[1],
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .fontSize)),
                      Text('order # ${data[index]!.id.split('-')[0]}',
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .fontSize)),
                    ],
                  ),
                  Text('\$ ${data[index]?.ordertotal}',
                      style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .fontSize)),
                  Text(formatted,
                      style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .fontSize)),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class AssignedViewWidget extends ConsumerWidget {
  const AssignedViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getOrders = ref.watch(getListOfAssignedOrdersProvider);
    return getOrders.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text('Error: $error'),
      data: (data) {
        safePrint(data.length);
        return ListView.separated(
          itemCount: data.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          itemBuilder: (BuildContext context, int index) {
            final DateFormat formatter = DateFormat('yyyy-MM-dd');
            //get dateTime from temporalDate
            final String formatted = formatter
                .format(DateTime.parse(data[index]!.createdAt.toString()));
            //String date = DateFormat.yMMMd().add_Hm().format(myvalue);
            return ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/orderDetails',
                    arguments: data[index]);
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(data[index]!.orderstatus.toString().split('.')[1],
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .fontSize)),
                      Text('order # ${data[index]!.id.split('-')[0]}',
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .fontSize)),
                    ],
                  ),
                  Text('\$ ${data[index]?.ordertotal}',
                      style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .fontSize)),
                  Text(formatted,
                      style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .fontSize)),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class StreamAssignedViewWidget extends ConsumerWidget {
  const StreamAssignedViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getOrders = ref.read(getListOfAssignedOrdersProvider);
    return getOrders.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text('Error: $error'),
      data: (data) {
        safePrint(data.length);
        return ListView.separated(
          itemCount: data.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          itemBuilder: (BuildContext context, int index) {
            final DateFormat formatter = DateFormat('yyyy-MM-dd');
            //get dateTime from temporalDate
            final String formatted = formatter
                .format(DateTime.parse(data[index]!.createdAt.toString()));
            //String date = DateFormat.yMMMd().add_Hm().format(myvalue);
            return ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/orderDetails',
                    arguments: data[index]);
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(data[index]!.orderstatus.toString().split('.')[1],
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .fontSize)),
                      Text('order # ${data[index]!.id.split('-')[0]}',
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .fontSize)),
                    ],
                  ),
                  Text('\$ ${data[index]?.ordertotal}',
                      style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .fontSize)),
                  Text(formatted,
                      style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .fontSize)),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
