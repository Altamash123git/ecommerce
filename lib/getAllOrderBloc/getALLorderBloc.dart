import 'package:ecommerce/Models/getOrderModel.dart';
import 'package:ecommerce/getAllOrderBloc/getAllOrderEvent.dart';
import 'package:ecommerce/getAllOrderBloc/getAllOrderState.dart';
import 'package:ecommerce/remote/api_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../remote/urls.dart';

class GetAllOrderBloc extends Bloc<GetAllOrderEvent, GetAllOrderState> {
  final ApiHelper apiHelper;

  GetAllOrderBloc({required this.apiHelper}) : super(GetOrderInitialState()) {
    on<getAllMyPlacedOrder>(_onGetAllMyPlacedOrder);
  }

  Future<void> _onGetAllMyPlacedOrder(
      getAllMyPlacedOrder event, Emitter<GetAllOrderState> emit) async {
    emit(GetOrderLoadingState());

    try {
      final Map<String, dynamic> res =
      await apiHelper.PostApi(url: Urls.GET_PLACED_ORDER);

      bool isSuccess =   res["status"] == true;
      print(res["status"]);

      if (isSuccess) {
        emit(GetOrderLoadedState(order: GetOrderModel.fromJson(res).orders!));
      } else {
        emit(GetOrderErrorState(errorMsg: res["message"] ?? "Unknown error"));
      }
    } catch (e) {
      emit(GetOrderErrorState(errorMsg: e.toString()));
    }
  }
}