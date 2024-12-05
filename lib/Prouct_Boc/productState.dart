import 'package:ecommerce/Models/productModel.dart';

abstract class ProductState{}

class ProductInitialState extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductLoadedState extends ProductState{
  ProductDataModel mData;
  ProductLoadedState({required this.mData});

}
class ProductErrorState extends ProductState{
  String errorMsg;
  ProductErrorState({required this.errorMsg});
}
