import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:products_json/product_model.dart';

Future<List<Products>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var res = jsonDecode(response.body) as Map<String, dynamic>;
    List<Products> products = Object.fromJson(res).products;
    return products;
    // return List.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load image');
  }
}

void main() {
  fetchProducts();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Products>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Row(
            children: const [
              Icon(Icons.add),
              Text('List of Products'),
            ],
          )),
      body: FutureBuilder<List<Products>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.all(6.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 3, color: Colors.blueAccent)),
                      child: snapshot.data != null
                          ? Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text('Id:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(snapshot.data![index].id.toString()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Title:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(snapshot.data![index].title),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Description:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          snapshot.data![index].description,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('price:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(snapshot.data![index].price
                                          .toString()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Brand:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(snapshot.data![index].brand),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Category:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(snapshot.data![index].category),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            snapshot.data![index].image.length,
                                        itemBuilder: (context, index2) {
                                          return Container(
                                            margin: const EdgeInsets.all(2.0),
                                            padding: const EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.blueAccent)),
                                            child: Image.network(
                                              snapshot
                                                  .data![index].image[index2]
                                                  .toString(),
                                              height: 50,
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              ),
                            )
                          : const CircularProgressIndicator());
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
