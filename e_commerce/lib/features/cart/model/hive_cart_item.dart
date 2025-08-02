import 'package:e_commerce/models/product.dart';
import 'package:hive/hive.dart';

import 'package:e_commerce/features/cart/model/cart_item.dart';

part 'hive_cart_item.g.dart';

@HiveType(typeId: 0)
class HiveCartItem extends HiveObject {
  @HiveField(0)
  final int productId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final num price;

  @HiveField(5)
  final int quantity;

  HiveCartItem({
    required this.productId,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
  });

  CartItem toDomain() => CartItem(
    product: Product(id: productId, title: title, description: description, price: price, image: image),
    quantity: quantity,
  );

  static HiveCartItem fromDomain(CartItem item) => HiveCartItem(
    productId: item.product.id,
    title: item.product.title,
    description: item.product.description,
    image: item.product.image,
    price: item.product.price,
    quantity: item.quantity,
  );
}
