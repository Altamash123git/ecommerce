abstract class CreateOrderState{}

class CreateOrderInitialState extends CreateOrderState{}

class CreateOrderLoadingState extends CreateOrderState{}
class CreateOrderSuccessState extends CreateOrderState{}
class CreateOrderFailureState extends CreateOrderState{
  String errorMsg;
  CreateOrderFailureState({required this.errorMsg});
}
