// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_declarations, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/theme_data.dart';
import 'package:flutter/material.dart';
// import 'package:catalog_app/widgets/theme_data.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/core/store.dart';

class DetailPage extends StatelessWidget {
  static const String id = "detail";

  DetailPage(this.catalog);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        // bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.imageUrl,
                // fit: BoxFit.cover,
              ).h24(context).py24(),
            ),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  // color: Colors.blueGrey,
                  color: MyTheme.orange500,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.bold.color(Colors.white).make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle!)
                          .xl
                          .color(Colors.white)
                          .make(),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        // color: Colors.white12,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.only(right: 15.0, left: 15.0),
          children: [
            "\$${catalog.price}".text.xl4.bold.color(MyTheme.orange500).make(),
            DetailToCart(
              catalog: catalog,
            ).wh(150, 50),
          ],
        ),
      ),
    );
  }
}

class DetailToCart extends StatelessWidget {
  final Item catalog;

  DetailToCart({required this.catalog});

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
        // elevation: MaterialStateProperty.all(0.0),
        backgroundColor: MaterialStateProperty.all(MyTheme.orange500),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isInCart
          ? Icon(Icons.done)
          : "ADD TO CART".text.white.xl2.bold.make(),
    );
  }
}
