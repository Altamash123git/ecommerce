import 'package:ecommerce/cart/cartBloc.dart';
import 'package:ecommerce/getAllOrderBloc/getALLorderBloc.dart';
import 'package:ecommerce/getAllOrderBloc/getAllOrderState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../getAllOrderBloc/getAllOrderEvent.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetAllOrderBloc>().add(getAllMyPlacedOrder());
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetAllOrderBloc,GetAllOrderState>(builder:(_,state){
        if(state is GetOrderLoadingState){
          return Center(
            child: CircularProgressIndicator(),

          );
        }
        if(state is GetOrderErrorState){
          return Center(child: Text(state.errorMsg),);
        }if(state is GetOrderLoadedState){
          return
            ListView.builder(
                itemCount: state.order.length,
                itemBuilder: (_,index){
                  return ListTile(
                    title: Text(state.order[index].id.toString()),
                  );
                });
        }
        return  Container();


      } ),
    );
  }
}
