import 'package:bloc/bloc.dart';
import 'package:ecommerce/create_order/create_order_state.dart';
import 'package:ecommerce/create_order/creater_order_event.dart';
import 'package:ecommerce/remote/api_helper.dart';
import 'package:ecommerce/remote/urls.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  final ApiHelper apiHelper;

  CreateOrderBloc({required this.apiHelper}) : super(CreateOrderInitialState()) {
    on<CreateMyOrder>((event,emit)async{
      try {

        List<Map<String, dynamic>> products = event.products.map((p) => p.toJson()).toList();

        var response = await apiHelper.PostApi(
          url: Urls.CREATE_ORDER_URL,
          mBodyParams: {
            "products": products,
            "status": event.status,
          },
        );

        // Validate response
        if (response['status'] == "true" || response['status'] == true) {
          emit(CreateOrderSuccessState());
        } else {
          emit(CreateOrderFailureState(errorMsg: response['message']));
        }
      } catch (e) {
        emit(CreateOrderFailureState(errorMsg: e.toString()));
      }
    });
  }

  Future<void> _onCreateMyOrder(CreateMyOrder event, Emitter<CreateOrderState> emit) async {
    emit(CreateOrderLoadingState());

    try {

      List<Map<String, dynamic>> products = event.products.map((p) => p.toJson()).toList();

      var response = await apiHelper.PostApi(
        url: Urls.CREATE_ORDER_URL,
        mBodyParams: {
          "products": products,
          "status": event.status,
        },
      );

      // Validate response
      if (response['status'] == "true" || response['status'] == true) {
        emit(CreateOrderSuccessState());
      } else {
        emit(CreateOrderFailureState(errorMsg: response['message']));
      }
    } catch (e) {
      emit(CreateOrderFailureState(errorMsg: e.toString()));
    }
  }
}
