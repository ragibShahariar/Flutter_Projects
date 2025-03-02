import 'package:flutter/material.dart';
import 'package:myapp/Data/models/item.dart';

class ProductTile extends StatelessWidget {
  final Item singleItem;
  final int index;
  final Function productDialogue;
  final Function deleteProduct;

  const ProductTile({
    Key? key,
    required this.singleItem,
    required this.index,
    required this.productDialogue,
    required this.deleteProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Image.network(
            "https://picsum.photos/200/300?random=$index",
            width: 100,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          '${singleItem.itemName}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Price: \$${singleItem.unitPrice} |\nQty: ${singleItem.qty}",
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                productDialogue(
                  itemID: singleItem.id,
                  itemName: singleItem.itemName,
                  itemImage: singleItem.img,
                  itemQty: singleItem.qty,
                  itemUnitPrice: singleItem.unitPrice,
                  itemTotalPrice: singleItem.totalPrice,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                deleteProduct(singleItem.id); // Call delete function here
              },
            ),
          ],
        ),
      ),
    );
  }
}
