class ViewCartDataModel{
  int? id;
  int? product_id;
  String? name;
  String? price;
  int? quantity;
  String? image;

  ViewCartDataModel({required this.price,required this.name,required this.id,required this.image,
  required this.product_id,required this.quantity
  });

 factory ViewCartDataModel.fromJson(Map<String, dynamic> json){
   return ViewCartDataModel(price: json["price"], name: json["name"], id: json["id"], image: json["image"], product_id: json["product_id"], quantity: json["quantity"]);
 }

}


class CartModel{
  bool? status;
  String? message;
  List<ViewCartDataModel>? data;

  CartModel({required this.data,required this.message,required this.status});


  factory CartModel.fromJson(Map<String,dynamic> json){

    List<ViewCartDataModel> data=[];
    for(Map<String,dynamic> eachMap in json["data"]){
      data.add(ViewCartDataModel.fromJson(eachMap));

    }

    return  CartModel(data: data, message: json["message"], status: json["status"]);
  }
}