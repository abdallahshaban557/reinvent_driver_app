import 'package:amplify_api/model_mutations.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reinvent_driver_app/main.dart';
import 'package:reinvent_driver_app/models/ModelProvider.dart';

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
          body: TabBarView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Text("Open Popup"),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return OrderPopup();
                            });
                      },
                    ),
                    const SignOutButton(),
                    ElevatedButton(
                        onPressed: () async {
                          //print current authenticated user
                          print(await Amplify.Auth.getCurrentUser());
                        },
                        child: const Text('print user')),
                    ElevatedButton(
                      child: const Text("Create Order"),
                      onPressed: () async {
                        final order = Order(
                            ordertotal: 100, orderstatus: OrderStatus.NEW);
                        final request = ModelMutations.create(order);
                        final response =
                            await Amplify.API.mutate(request: request).response;
                        final createdOrder = response.data;
                        safePrint(createdOrder?.ordertotal);
                        if (createdOrder == null) {
                          safePrint('errors: ${response.errors}');
                          return;
                        }
                      },
                    ),
                  ],
                ),
              ),
              HistoryViewWidget()
            ],
          ),
        ));
  }
}

class HistoryViewWidget extends ConsumerWidget {
  const HistoryViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getOrders = ref.watch(getListOfOrdersProvider);
    // print(value);
    return ListView.separated(
      itemCount: getOrders.value?.length ?? 0,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 1,
        color: Colors.black,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(getOrders.value![index]!.ordertotal.toString(),
                      style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .fontSize)),
                  Text('order # $index',
                      style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .fontSize)),
                ],
              ),
              Text('${getOrders.value![index]?.ordertotal}',
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize)),
              Text('Date $index',
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize)),
            ],
          ),
        );
      },
    );
  }
}

class OrderPopup extends StatelessWidget {
  const OrderPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      scrollable: true,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'New order assigned to you',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: const Text(
                  "Accept",
                ),
                onPressed: () {
                  // your code
                },
              ),
              ElevatedButton(
                child: const Text(
                  "Reject",
                ),
                onPressed: () {
                  // your code
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
