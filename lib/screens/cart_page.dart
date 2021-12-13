// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/widgets/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/models/cart.dart';

class CartPage extends StatelessWidget {
  static const String id = "cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        title: Center(
          child: 'Cart'.text.color(MyTheme.darkBluishColor).xl2.make(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CartList().p24(),
            ),
            Divider(),
            _CartTotal(),
          ],
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, store, status) {
              return '\$${cart.totalPrice}'
                  .text
                  .xl4
                  .color(MyTheme.darkBluishColor)
                  .make();
            },
          ),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet".text.make(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyTheme.orange500),
            ),
            child: "Buy".text.xl.color(MyTheme.darkBluishColor).bold.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;
    return cart.cartItems.isEmpty
        ? "No Products in cart".text.xl.makeCentered()
        : ListView.builder(
            itemCount: cart.cartItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    RemoveMutation(cart.cartItems[index]);
                  },
                ),
                title: cart.cartItems[index].name.text.make(),
              );
            },
          );
  }
}
