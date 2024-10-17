import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  Future<List> _getProduct() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    var respone = await http.get(url);
    final data = jsonDecode(respone.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: FutureBuilder<List>(
          future: _getProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data == null) {
              return Center(
                // child: Text("No data"),
                child: ElevatedButton(
                  child: Text("No record"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(data: 12),
                      ),
                    );
                  },
                ),
              );
            }
            if (snapshot.data != null) {
              var product = snapshot.data!;
              return GridView.builder(
                itemCount: product.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // Number of items per row
                  crossAxisSpacing: 10.0,
                  // Horizontal spacing between grid items
                  mainAxisSpacing: 10.0,
                  // Vertical spacing between grid items
                  childAspectRatio: 0.75, // Aspect ratio of grid items
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        data: product[index]['id']),
                                  ),
                                );
                              },
                              child: Image.network(
                                product[index]['image'],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product[index]['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "${product[index]['price'].toString()} \$",
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    print("Favorite");
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    print("Add to Cart");
                                  },
                                  icon: const Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const Text("No widget to build");
          }),
    );
  }
}
