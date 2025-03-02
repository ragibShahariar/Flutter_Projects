class Item {
  String? id;
  String itemName;
  String img;
  int qty;
  int unitPrice;
  int totalPrice;

  Item({
    this.id,
    required this.itemName,
    required this.img,
    required this.qty,
    required this.unitPrice,
    required this.totalPrice,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json["_id"],
      itemName: json["ProductName"],
      img: json["Img"],
      qty: json["Qty"],
      unitPrice: json["UnitPrice"],
      totalPrice: json["TotalPrice"],
    );
  }
}