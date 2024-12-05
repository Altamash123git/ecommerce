abstract class CreateOrderEvent{}


class CreateMyOrder extends CreateOrderEvent {
  final List<OrderProduct> products;
  final int status; // e.g., 1 for pending, 2 for confirmed
  CreateMyOrder({required this.products, required this.status});
}

class OrderProduct {
  final int productId;
  final int quantity;

  OrderProduct({required this.productId, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      "quantity": quantity,
    };
  }
}