// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_null_comparison, prefer_const_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:catalog_app/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget(
      {required this.imageUrl,
      required this.itemTitle,
      required this.itemSubtitle,
      required this.itemPrice});

  // final Item item;
  final String imageUrl;
  final String itemTitle;
  final String itemSubtitle;
  final num itemPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print('item pressed');
        },
        leading: Image.network(imageUrl),
        title: Text(itemTitle),
        subtitle: Text(itemSubtitle),
        trailing: Text(
          "\$ ${itemPrice.toString()}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 1.2,
        ),
      ),
    );
  }
}
