import 'package:ecommerce/gobpRepository/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../model.dart';
import 'bloc_implementation.dart';
import 'event.dart';


class MyOrdersScreen extends StatefulWidget {
  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final TextEditingController searchController = TextEditingController();
  late OrderBloc orderBloc;

  @override
  void initState() {
    super.initState();
    orderBloc = BlocProvider.of<OrderBloc>(context);
    orderBloc.add(FetchOrders());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  if (state is OrderLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is OrderLoaded) {
                    List<Order> orders = state.orders;
                    return ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        return Card(
                          margin: EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(order.customerName),
                            subtitle: Text(
                              "Date: ${order.orderDate}\nOrder ID: ${order.orderId}",
                            ),
                            trailing: ElevatedButton(
                              onPressed: () => _showOrderDetails(context, order),
                              child: Text("View Details"),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is OrderError) {
                    return Center(child: Text(state.message));
                  }
                  return Center(child: Text("No Orders Found"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showOrderDetails(BuildContext context, Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Order Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("MobileNo: ${order.mobileNo}"),
              Text("OrderAmount: ₹${order.orderAmount}"),
              Text("Product: ${order.product}"),
              Text("OrderStatus: ${order.orderStatus}"),
              Text("DeviceType: ${order.deviceType}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            )
          ],
        );
      },
    );
  }
}
