import 'package:equatable/equatable.dart';

import '../model.dart';
//import '../models/order_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final List<Order> orders;
  OrderLoaded(this.orders);
}

class OrderError extends OrderState {
  final String message;
  OrderError(this.message);
}

