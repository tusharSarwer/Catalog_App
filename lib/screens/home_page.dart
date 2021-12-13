// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unnecessary_null_comparison, unused_import, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/screens/cart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/widgets/drawer.dart';
// import 'package:catalog_app/widgets/item_widget.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/widgets/theme_data.dart';
import 'package:catalog_app/widgets/home_widget/catalog_header.dart';
import 'package:catalog_app/widgets/home_widget/catalog_list.dart';

// final dummyList = List.generate(10, (index) => CatalogModel.items[0]);

class HomePage extends StatefulWidget {
  static const String id = "home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(Duration(seconds: 2));
    //   final catalogData = await rootBundle.loadString("files/catalog.json");
    //   final decodeData = jsonDecode(catalogData);
    //   var productData = decodeData['products'];
    //   // print(productData);
    //   CatalogModel.items =
    //       List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    //   setState(() {});
    // for (int i = 0; i < CatalogModel.items.length; i++) {
    //   return CatalogModel.items[i];
    // }
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, store, status) {
            return FloatingActionButton(
              backgroundColor: MyTheme.blue800,
              onPressed: () => context.vxNav.push(Uri.parse(CartPage.id)),
              child: Icon(CupertinoIcons.shopping_cart),
            ).badge(
              color: MyTheme.orange500,
              size: 21,
              count: cart.cartItems.length,
              textStyle: TextStyle(
                color: MyTheme.darkBluishColor,
                fontSize: 12.0,
              ),
            );
          },
        ),
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Container(
            padding: Vx.m20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                CatalogModel.items.isNotEmpty
                    ? CatalogList().py16().expand()
                    : Center(
                        child: CircularProgressIndicator().expand(),
                      ),
              ],
            ),
          ),
        ));
  }
}

// Theme(
// data: Theme.of(context).copyWith(
// canvasColor:
// Colors.red, //This will change the drawer background to blue.
// //other styles
// ),

// CatalogModel.items != null &&

// ListView.builder(
// itemBuilder: (context, index) => ItemWidget(
// imageUrl: dummyList[index].imageUrl,
// itemTitle: dummyList[index].name,
// itemSubtitle: dummyList[index].desc,
// itemPrice: dummyList[index].price,
// ),
// itemCount: dummyList.length,
// )

// Padding(
// padding: EdgeInsets.all(16.0),
// child: (CatalogModel.items.isNotEmpty)
// ? GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisSpacing: 10,
// crossAxisSpacing: 10,
// ),
// itemCount: dummyList.length,
// itemBuilder: (context, index) {
// return Card(
// clipBehavior: Clip.antiAlias,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(12.0),
// ),
// child: GridTile(
// header: Text(dummyList[index].name),
// footer: Text(dummyList[index].price.toString()),
// child: Image.network(dummyList[index].imageUrl),
// ),
// );
// },
// )
// : Center(
// child: CircularProgressIndicator(),
// ),
// ),
// drawer: MyDrawer(),

// Navigator.pushNamed(context, CartPage.id)
