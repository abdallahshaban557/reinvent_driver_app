import 'dart:convert';
import 'dart:ffi';

import 'package:amplify_api/model_mutations.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
          body: SafeArea(
            child: TabBarView(
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
                          double orderTotal = 2.1111;
                          String graphQLDocumentString = '''
                            mutation MyMutation {
                            createOrder(input: {ordertotal: $orderTotal}) {
                              id
                              ordertotal
                              orderstatus
                            }
                          }
                          ''';
                          final operation = Amplify.API.mutate<Order>(
                            request: GraphQLRequest(
                              document: graphQLDocumentString,
                              apiName: 'reinventapp',
                              decodePath: 'createOrder',
                              modelType: Order.classType,
                            ),
                          );
                          final response = await operation.response;
                          final createdOrder = response.data;
                          safePrint(createdOrder.toString());

                          if (createdOrder == null) {
                            safePrint('errors: ${response.errors}');
                            return;
                          } else {}
                        },
                      ),
                    ],
                  ),
                ),
                HistoryViewWidget()
              ],
            ),
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
                  Text('${data[index]?.ordertotal}',
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
