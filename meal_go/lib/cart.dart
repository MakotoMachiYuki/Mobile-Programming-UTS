import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meal_go/orderplaced.dart';
import 'package:provider/provider.dart';
import 'model/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.orange),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: cart.food.isEmpty ? EmptyCart() : FoodList(cart: cart),
              ),
              if (!cart.food.isEmpty) const Divider(height: 4, color: Colors.black),
              if (!cart.food.isEmpty) TotalPayment(cart: cart),
            ],
          );
        },
      ),
    );
  }
}

class FoodList extends StatelessWidget {
  final CartModel cart;

  const FoodList({required this.cart});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cart.food.length,
      itemBuilder: (context, index) {
        var food = cart.food[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 3),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(food.image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          food.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp. ${food.price}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Qty: ${cart.itemPerFood(food) > 0 ? cart.itemPerFood(food) : 1}',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                cart.remove(cart.food[index]);
                              },
                            ),
                          ],
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
}

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Image.asset(
              'assets/cart.png',
              width: 300,
              height: 200,
            ),
          ),
          const Text(
            'Ouch! Hungry',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              "Seems like you haven't added any food to cart yet",
              style: TextStyle(fontSize: 17, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, '/backtohomepage');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Find Foods",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TotalPayment extends StatelessWidget {
  final CartModel cart;
  final orderFee = 10000;

  const TotalPayment({required this.cart});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Text(
                    'Total Patment',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Food Price'),
                      Text('Rp. ${cart.totalPrice}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order Price'),
                      Text('Rp. ${orderFee}'),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Price'),
                      Text('Rp. ${orderFee + cart.totalPrice}'),
                    ],
                  ),
                  const SizedBox(
                    width: 24,
                    height: 10,
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderPlacedPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    child: const Text('Order Food'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
