// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/core/store.dart';
import '../theme_data.dart';

class AddToCart extends StatelessWidget {
  AddToCart({required this.catalog});

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;
    bool isInCart = cart.cartItems.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(MyTheme.orange500),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isInCart
          ? Icon(Icons.done)
          : "Buy".text.color(MyTheme.darkBluishColor).make(),
    );
  }
}
