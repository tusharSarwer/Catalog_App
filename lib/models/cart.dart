// ignore_for_file: unused_field, unnecessary_getters_setters

import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/core/store.dart';

class CartModel {
  late CatalogModel _catalog;

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  final List<int> _itemIDs = [];

  List<Item> get cartItems =>
      _itemIDs.map((id) => _catalog.getByID(id)).toList();

  num get totalPrice =>
      cartItems.fold(0, (total, current) => total + current.price);

  void addItem(Item newItem) {
    _itemIDs.add(newItem.id);
  }

  void removeItem(Item removeItem) {
    _itemIDs.remove(removeItem.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemIDs.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemIDs.remove(item.id);
  }
}
