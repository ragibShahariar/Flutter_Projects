// ignore: file_names
import 'dart:convert';
import 'package:myapp/Data/models/item.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/_Utils/urls.dart';

class ProductController {
  List<Item> products = [];

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse(Urls.readProduct));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      products = data['data'].map<Item>((item) => Item.fromJson(item)).toList();
    }
  }

  Future<void> createProduct(Item item) async {
    final response = await http.post(Uri.parse(Urls.createProduct),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "ProductName": item.itemName,
          "ProductCode": DateTime.now().microsecondsSinceEpoch,
          "Img": item.img,
          "Qty": item.qty,
          "UnitPrice": item.unitPrice,
          "TotalPrice": item.totalPrice
        }));
  }

  Future<void> updateProduct(String id, Item item) async {
    final response = await http.post(Uri.parse(Urls.updateProduct(id)),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "ProductName": item.itemName,
          "ProductCode": DateTime.now().microsecondsSinceEpoch,
          "Img": item.img,
          "Qty": item.qty,
          "UnitPrice": item.unitPrice,
          "TotalPrice": item.totalPrice
        }));
  }

  Future<bool> deleteProduct(String id) async {
    final response = await http.get(Uri.parse(Urls.deleteProduct(id)));
    if (response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
}