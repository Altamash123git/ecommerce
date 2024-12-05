import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Models/getOrderModel.dart';

abstract class GetAllOrderState{}

class GetOrderInitialState extends GetAllOrderState{}
class GetOrderLoadingState extends GetAllOrderState{}
class GetOrderErrorState extends GetAllOrderState{
  String errorMsg;
  GetOrderErrorState({required this.errorMsg});

}
class GetOrderLoadedState extends GetAllOrderState{

  List<OrdersPlaced >order;
  GetOrderLoadedState({required this.order});
}
