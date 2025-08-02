import 'package:e_commerce/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce/features/cart/model/cart_item.dart';
import 'package:e_commerce/features/cart/service/cart_local_service.dart';

class CartViewModel extends StateNotifier<List<CartItem>>{
  final CartLocalService _service;
  CartViewModel(this._service) : super([]){
    _load();
  }
  void _load(){
    state = _service.getItems();
  }

  Future<void> addProduct(Product product) async{
    final index = state.indexWhere((e) => e.product.id == product.id);
    if(index >=0 ){
      final updated = state[index].copyWith(quantity: state[index].quantity+1);
      await _service.saveItems(updated);
    }else{
      final newItem = CartItem(product: product, quantity: 1);
      await _service.saveItems(newItem);
    }
    _load();
  }

  Future<void> removeProduct(Product product) async{
    final index = state.indexWhere((e) => e.product.id == product.id);
    if(index == -1) return;
    final current = state[index];
    if(current.quantity > 1){
      final update = state[index].copyWith(quantity: state[index].quantity-1);
      await _service.saveItems(update);
    }else{
      await _service.delete(product.id);
    }
    _load();
  }

  Future<void> clearCart() async{
    _service.clear();
    _load();
  }
}