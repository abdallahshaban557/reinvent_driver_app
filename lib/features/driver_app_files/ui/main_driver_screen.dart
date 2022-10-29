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
          body: TabBarView(
            children: [
              Center(
                child: ElevatedButton(
                  child: const Text("Open Popup"),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return OrderPopup();
                        });
                  },
                ),
              ),
              HistoryViewWidget()
            ],
          ),
        ));
  }
}

class HistoryViewWidget extends StatelessWidget {
  const HistoryViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 25,
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
                  Text('Customer $index',
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
              Text('something_else $index',
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
