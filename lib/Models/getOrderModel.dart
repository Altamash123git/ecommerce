class GetOrderModel {
  bool? status;
  String? message;
  List<OrdersPlaced>? orders;

  GetOrderModel({this.status, this.message, this.orders});

 factory  GetOrderModel.fromJson(Map<String, dynamic> json) {

    //status = json['status'] is bool ? json['status'] : json['status'] == 'true';
List<OrdersPlaced> orders=[];
     if (json['orders'] != null) {
       orders = <OrdersPlaced>[];
       json['orders'].forEach((v) {
         orders!.add(OrdersPlaced.fromJson(v));
       });

   }
     return  GetOrderModel(status: json["status"],message: json["message"],orders: orders);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class OrdersPlaced {
  int? id;
  String? totalAmount;
  String? orderNumber;
  String? status;
  String? createdAt;
  List<Product>? product;

  OrdersPlaced({
    this.id,
    this.totalAmount,
    this.orderNumber,
    this.status,
    this.createdAt,
    this.product,
  });

  OrdersPlaced.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalAmount = json['total_amount']?.toString();  // Convert to String if needed
    orderNumber = json['order_number'];
    status = json['status'];
    createdAt = json['created_at'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total_amount'] = totalAmount;
    data['order_number'] = orderNumber;
    data['status'] = status;
    data['created_at'] = createdAt;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Product {
  int? id;
  String? name;
  int? quantity;
  String? price;
  String? image;

  Product({this.id, this.name, this.quantity, this.price, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}