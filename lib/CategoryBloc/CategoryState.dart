 import 'package:ecommerce/Models/categoryModel.dart';

abstract class CategoryState{}


 class CategorynItialState extends CategoryState{}

 class CategoryLoadingState extends CategoryState{}
 class CategoryLoadedState extends CategoryState{
  CategoryModel mdata;
  CategoryLoadedState({required this.mdata});

 }
 class CategoryErrorState extends CategoryState{
  String erroMsg;
  CategoryErrorState({required this.erroMsg});
 }