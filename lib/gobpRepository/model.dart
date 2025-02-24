class Order {
  final String orderId;
  final String orderDate;
  final String customerName;
  final String mobileNo;
  final String orderAmount;
  final String product;
  final String orderStatus;
  final String deviceType;

  Order({
    required this.orderId,
    required this.orderDate,
    required this.customerName,
    required this.mobileNo,
    required this.orderAmount,
    required this.product,
    required this.orderStatus,
    required this.deviceType,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['OrderID']?.toString() ?? 'N/A',
      orderDate: json['OrderDate'] ?? 'N/A',
      customerName: json['CustomerName'] ?? 'Unknown',
      mobileNo: json['MobileNo'] ?? 'N/A',
      orderAmount: json['OrderAmount']?.toString() ?? '0',
      product: json['Product'] ?? 'No Product',
      orderStatus: json['OrderStatus'] ?? 'Unknown',
      deviceType: json['DeviceType'] ?? 'Unknown',
    );
  }
}
