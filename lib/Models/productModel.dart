class ProductDataModel{
  bool? status;
  String? message;
  List<ProductModel>? data;
  ProductDataModel({required this.status,required this.data,required this.message});


  factory ProductDataModel.fromJson(Map<String ,dynamic> json){

    List<ProductModel> data=[];
    for(Map<String,dynamic> eachMap in json["data"]){
      data.add(ProductModel.fromJson(eachMap));

    }

    return ProductDataModel(status: json["status"], data: data, message: json["message"]);
  }
}


class ProductModel{
  String? id;
  String? name;
  String? price;
  String? imgUrl;
  String? category_id;
  String? status;
  String? created_at;
  String? updated_at;
  ProductModel({required this.name,required this.status,required this.id,required this.imgUrl,
    required this.price,
    required this.category_id,
    required this.created_at,
    required this.updated_at,
  });

  factory ProductModel.fromJson(Map<String,dynamic>json){
    return ProductModel
      (
        name: json['name'], status: json['status'], id: json["id"], imgUrl: json["image"], price: json['price'], category_id: json['category_id'], created_at: json['created_at'], updated_at: json['updated_at']

    );
  }



}