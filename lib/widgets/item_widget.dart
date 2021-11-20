// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_null_comparison, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:catalog_app/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print('item pressed');
        },
        leading: Image.network(item.imageUrl),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$ ${item.price.toString()}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 1.2,
        ),
      ),
    );
  }
}
