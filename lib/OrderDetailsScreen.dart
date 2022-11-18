import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:reinvent_driver_app/models/Order.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'models/Customer.dart';
import 'models/ModelProvider.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Order;
    safePrint(args);
    final String mapsQuery =
        '${args.orderaddress!.street}, ${args.orderaddress!.city}, ${args.orderaddress!.state} ${args.orderaddress!.zip}, USA';
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Name: ${args.customer!.firstName}'),
                    ElevatedButton(
                        onPressed: () {
                          MapsLauncher.launchQuery(mapsQuery);
                        },
                        child: const Text('Address'))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Order (${args.ordereditems!.length} items)',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text('Total: \$${args.ordertotal}'),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: args.ordereditems!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                              "${args.ordereditems![index].quantity} ${args.ordereditems![index].name}"),
                          Text("\$${args.ordereditems![index].price}"),
                        ],
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: OrderDetailsButton(order: args),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//stateless widget button
class OrderDetailsButton extends StatelessWidget {
  OrderDetailsButton({
    super.key,
    required this.order,
  });
  Order order;

  Future<void> updateTodo() async {
    if (order.orderstatus == OrderStatus.NEW) {
      final Order updatedOrder =
          order.copyWith(orderstatus: OrderStatus.ONROUTE);
      final request = ModelMutations.update(updatedOrder);
      final response = await Amplify.API.mutate(request: request).response;
      safePrint('Response: $response');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (order.orderstatus == OrderStatus.NEW) {
      return ElevatedButton(
        onPressed: () async {
          await updateTodo();
        },
        child: const Text('Accept Order'),
      );
    } else if (order.orderstatus == OrderStatus.INPROGRESS) {
      return ElevatedButton(
        onPressed: () {
          //api mutation to change orderstatus
        },
        child: const Text('Order Picked up'),
      );
    } else if (order.orderstatus == OrderStatus.ONROUTE) {
      return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/orderdetails', arguments: order);
        },
        child: const Text('Order Delivered'),
      );
    } else {
      return Container();
    }
  }
}
