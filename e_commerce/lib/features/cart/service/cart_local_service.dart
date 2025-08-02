import 'package:e_commerce/features/cart/model/cart_item.dart';
import 'package:hive/hive.dart';

import 'package:e_commerce/features/cart/model/hive_cart_item.dart';

class CartLocalService{
  final Box<HiveCartItem> box;
  CartLocalService(this.box);

  List<CartItem> getItems(){
    return box.values.map((e) => e.toDomain()).toList();
  }

  Future<void> saveItems(CartItem item) async{
    await box.put(item.product.id, HiveCartItem.fromDomain(item));
  }

  Future<void> delete(int productId) async{
    await box.delete(productId);
  }

  Future<void> clear() async{
    await box.clear();
  }
}