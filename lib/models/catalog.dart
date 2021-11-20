// ignore_for_file: unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'dart:convert';

class Item {
  dynamic id;
  dynamic name;
  dynamic desc;
  dynamic price;
  dynamic color;
  dynamic imageUrl;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.imageUrl});

  Item copyWith({
    dynamic id,
    dynamic name,
    dynamic desc,
    dynamic price,
    dynamic color,
    dynamic imageUrl,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'id': id.toMap(),
      'name': name.toMap(),
      'desc': desc.toMap(),
      'price': price.toMap(),
      'color': color.toMap(),
      'imageUrl': imageUrl.toMap(),
    };
  }

  factory Item.fromMap(Map<dynamic, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        imageUrl.hashCode;
  }
}

class CatalogModel {
  static List<Item> items = [];
}
