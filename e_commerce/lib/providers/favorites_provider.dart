import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce/models/product.dart';

class FavoriteItemNotifier extends StateNotifier<List<Product>> {
  FavoriteItemNotifier() : super([]);

  bool toggleWishlistItem(Product product){
    final isExisting = state.contains(product);
    if(isExisting){
      state = state.where((p) => p.id != product.id).toList();
      return false;
    }
    else{
      state = [product, ...state];
      return true;
    }
  }
}

final favoriteItemsProvider =
    StateNotifierProvider<FavoriteItemNotifier, List<Product>>((ref) {
  return FavoriteItemNotifier();
});
