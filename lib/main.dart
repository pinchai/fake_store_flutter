import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail.dart';
import 'product_list.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(onPressed:(){}, icon: Icon(Icons.point_of_sale_outlined)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, left: 10),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications),
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                  accountName: Text(
                    "Pinchai",
                  ),
                  accountEmail: Text("pinchai.pc@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        "https://lh3.googleusercontent.com/a/ACg8ocLXsp7CqOkhrOtVfXlZoPNMKM1huqRMWuhuri9fdDu4iOv-tUvJPA=s576-c-no"),
                  )),
              ListTile(
                leading: const Icon(
                  Icons.line_style,
                  size: 50,
                ),
                title:
                    const Text("Product List", style: TextStyle(fontSize: 18)),
                subtitle: const Text("display all product item..."),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductList()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.manage_accounts,
                  size: 50,
                ),
                title: const Text("Profile", style: TextStyle(fontSize: 18)),
                subtitle: const Text("view or edit your profile"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(data: 1)));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.contact_page,
                  size: 50,
                ),
                title: const Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: const Text("contact our team while issue"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(data: 1)));
                },
              ),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Version 1.0",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: const Card(
                        child: SizedBox(
                          height: 100,
                          child: Column(
                            children: [
                              Icon(
                                Icons.point_of_sale,
                                size: 70,
                                color: Colors.greenAccent,
                              ),
                              Text(
                                "POINT OF SALE",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductList()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      child: const Card(
                        child: SizedBox(
                          height: 100,
                          child: Column(
                            children: [
                              Icon(
                                Icons.list_alt,
                                size: 70,
                                color: Colors.lightBlue,
                              ),
                              Text(
                                "Product List",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList()));
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
