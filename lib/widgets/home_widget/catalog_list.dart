// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

// import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/screens/details_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/widgets/theme_data.dart';
import 'package:catalog_app/widgets/home_widget/catalog_image.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/home_widget/add_to_cart.dart';

// final dummyList = List.generate(10, (index) => CatalogModel.items[0]);

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items;
        return InkWell(
          onTap: () {
            final _catalog = CatalogModel.items[index];
            context.vxNav.push(
                Uri(
                    path: DetailPage.id,
                    queryParameters: {'id': _catalog.id.toString()}),
                params: _catalog);
          },
          child: CatalogItem(catalog: catalog[index]),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  CatalogItem({required this.catalog});

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.imageUrl),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.bold.color(MyTheme.blue700).make(),
                catalog.desc.text.textStyle(context.captionStyle!).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.only(right: 15.0),
                  children: [
                    "\$${catalog.price}"
                        .text
                        .xl
                        .bold
                        .color(MyTheme.blue600)
                        .make(),
                    AddToCart(catalog: catalog),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ).white.rounded.square(150).make().py12();
  }
}

// {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => DetailPage(catalog[index])),
// );
// }
