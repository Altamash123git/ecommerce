import 'package:ecommerce/gobpRepository/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo.dart';

import 'event.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc({required this.orderRepository}) : super(OrderInitial()) {
    on<FetchOrders>(_fetchOrders);
  }

  Future<void> _fetchOrders(FetchOrders event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    try {
      final orders = await orderRepository.fetchOrders();
      emit(OrderLoaded(orders));
    } catch (e) {
      emit(OrderError("Failed to fetch orders: ${e.toString()}"));
    }
  }
}
