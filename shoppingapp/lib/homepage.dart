import 'package:flutter/material.dart';
import 'package:shoppingapp/OrderSuccessScreen.dart';

import 'model/product.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  List<Product> checkoutItems = [];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addtoCheckout(Product product) {
    setState(() {
      checkoutItems.add(product);
    });
  }

  void removeFromCheckout(Product product) {
    setState(() {
      checkoutItems.remove(product);
    });
  }

  static List<Product> products = [
    Product(id: '1', name: 'Nike Mercurial', price: 90),
    Product(id: '2', name: 'Addidas Predator', price: 120),
    Product(id: '3', name: 'Denim jeans', price: 19),
    Product(id: '4', name: 'Plain tees', price: 5),
    Product(id: '5', name: 'Customized Tees', price: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            Text(
              'Shopping App',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.purple.shade700,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _selectedIndex == 0
                ? Expanded(
                    child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                width: double.maxFinite,
                                height: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.purple),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: ListTile(
                                    title: Text(products[index].name),
                                    subtitle:
                                        Text('\$${products[index].price}'),
                                    trailing: IconButton(
                                      onPressed: () =>
                                          addtoCheckout(products[index]),
                                      icon: Icon(Icons.add),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        }),
                  )
                : Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: double.maxFinite,
                                height: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.purple),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: ListView.builder(
                                  itemCount: checkoutItems.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                        title: Text(checkoutItems[index].name),
                                        subtitle: Text(
                                            '\$${checkoutItems[index].price}'),
                                        trailing: IconButton(
                                          onPressed: () => removeFromCheckout(
                                              checkoutItems[index]),
                                          icon: Icon(Icons.remove),
                                        ));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple.shade800,
                            ),
                            onPressed: checkoutItems.isEmpty
                                ? null
                                : () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Ordersuccessscreen(),
                                      ),
                                    );
                                  },
                            child: Text(
                              'Place Order',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Checkout',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple.shade800,
        onTap: onItemTapped,
      ),
    );
  }
}
