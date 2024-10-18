// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartScreen extends StatelessWidget {
  final int user_id;

  // Constructor to accept data
  CartScreen({required this.user_id});

  Future<Map> _getProductDetail() async {
    var url = Uri.parse("https://fakestoreapi.com/products/${this.user_id}");
    var respone = await http.get(url);
    final data = jsonDecode(respone.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Map>(
              future: _getProductDetail(), // Fetch the data asynchronously
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 5,
                    ),
                  ); // Loading spinner
                }
                else if (snapshot.hasError) {
                  return Center(
                      child:
                          Text('Error: ${snapshot.error}')); // Error handling
                } else {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(15), //DecorationImage
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: Image.network("https://picsum.photos/id/3${index}/200/300"),
                                title: Text("Coca Cola"),
                                subtitle: Text("Quanty: 10 x 0.50\$ = 5.0\$"),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove_circle),
                                  color: Colors.redAccent,
                                ),
                              );
                            },
                          ),
                        ),
                        Divider(),
                        Expanded(
                            // flex: 1,
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Total: 100\$",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                  fontSize: 20),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Checkout!"),
                            )
                          ],
                        ))
                      ],
                    ),
                  ); // Display fetched data
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
