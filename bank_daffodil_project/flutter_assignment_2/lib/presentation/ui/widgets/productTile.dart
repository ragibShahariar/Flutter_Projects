

Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
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
                        "price: \$${singleItem.unitPrice} |\nQty: ${singleItem.qty}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () => productDialogue(
                                itemID: singleItem.id,
                                itemName: singleItem.itemName,
                                itemImage: singleItem.img,
                                itemQty: singleItem.qty,
                                itemTotalPrice: singleItem.totalPrice,
                                itemUnitPrice: singleItem.unitPrice),
                            icon: Icon(Icons.edit)),
                        IconButton(
                          onPressed: () async {
                            await productController
                                .deleteProduct(singleItem.id.toString())
                                .then((value) {
                              if (value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("item is deleted")));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("something went wrong!")));
                              }
                            });
                            await fetchData();
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );