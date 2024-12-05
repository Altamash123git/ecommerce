class  CategoryData{
  String? createdAt;
  String? id;
  String? name;
  String? status;
  String? updated_at;


  CategoryData({required this.name,required this.status,required this.updated_at,required this.id,required this.createdAt});


  factory CategoryData.fromJson(Map<String,dynamic>json){
    return CategoryData(name: json["name"], status: json["status"], updated_at:json["updated_at"], id:json["id"], createdAt: json["created_at"]);
  }

}
class CategoryModel{
  bool? status;
  String? message;
  List<CategoryData>? data;
  CategoryModel({required this.data,required this.status,required this.message});


  factory CategoryModel.fromJson(Map<String,dynamic> json){
    List<CategoryData> data=[];
    for(Map<String,dynamic> eachMap in json['data']){
      data.add(CategoryData.fromJson(eachMap));
    }


    return CategoryModel(data: data, status: json["status"], message: json["message"]);

  }


}