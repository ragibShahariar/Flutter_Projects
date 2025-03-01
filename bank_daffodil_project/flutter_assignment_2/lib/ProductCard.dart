import 'package:api/ProductController.dart';
import 'package:flutter/material.dart';
import 'package:api/model/item.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  ProductController productController = ProductController();

  void productDialogue(
      {String? itemID,
      String? itemName,
      String? itemImage,
      int? itemQty,
      int? itemUnitPrice,
      int? itemTotalPrice}) {
    TextEditingController productNameController = TextEditingController();
    TextEditingController productQuantityController = TextEditingController();
    TextEditingController productImageController = TextEditingController();
    TextEditingController productUnitPriceController = TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();

    productNameController.text = itemName ?? "";
    productImageController.text = itemImage ?? "";
    productQuantityController.text = itemQty != null ? itemQty.toString() : "";
    productUnitPriceController.text =
        itemUnitPrice != null ? itemUnitPrice.toString() : "";
    productTotalPriceController.text =
        itemTotalPrice != null ? itemTotalPrice.toString() : "";

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(itemID == null ? "Add Product" : "Update Product"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: productNameController,
                      decoration: InputDecoration(labelText: "Product name"),
                    ),
                    TextField(
                      controller: productImageController,
                      decoration: InputDecoration(labelText: "Product Image"),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: productQuantityController,
                      decoration: InputDecoration(labelText: "Product Qty"),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: productUnitPriceController,
                      decoration:
                          InputDecoration(labelText: "Product unit price"),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: productTotalPriceController,
                      decoration:
                          InputDecoration(labelText: "Product total price"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Close",
                            style: TextStyle(color: Colors.deepOrange),),),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white
                            ),
                            onPressed: () async {
                              // make function async
                              if (itemID == null) {
                                Item newItem = Item(
                                  itemName: productNameController.text,
                                  img: productImageController.text,
                                  qty:
                                      int.parse(productQuantityController.text),
                                  unitPrice: int.parse(
                                      productUnitPriceController.text),
                                  totalPrice: int.parse(
                                      productTotalPriceController.text),
                                );
                                await productController
                                    .createProduct(newItem); //await
                                await fetchData(); //await
                              } else {
                                Item newItem = Item(
                                  itemName: productNameController.text,
                                  img: productImageController.text,
                                  qty:
                                      int.parse(productQuantityController.text),
                                  unitPrice: int.parse(
                                      productUnitPriceController.text),
                                  totalPrice: int.parse(
                                      productTotalPriceController.text),
                                );
                                await productController.updateProduct(
                                    itemID, newItem); //await
                                await fetchData(); //await
                              }
                              Navigator.pop(context);
                            },
                            child: Text(itemID != null
                                ? "Update Product"
                                : "Add Product")),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }

  Future<void> fetchData() async {
    await productController.fetchProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Products",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.white,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: productController.products.length,
              itemBuilder: (context, index) {
                final singleItem = productController.products[index];
                return Card(
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
              }),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepOrange, Colors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          width: double.infinity,
          child: TextButton(
              onPressed: () {
                fetchData();
              },
              child: Text(
                "Tap to refresh",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrange,
        onPressed: () => productDialogue(),
        child: Icon(Icons.add),
      ),
    );
  }
}
