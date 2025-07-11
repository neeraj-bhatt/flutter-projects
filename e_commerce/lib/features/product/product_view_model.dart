import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/features/cart/viewmodel/cart_items_provider.dart';
import 'package:e_commerce/providers/favorites_provider.dart';

class ProductViewModel {
  final Ref ref;
  ProductViewModel(this.ref);
  bool isFavorite(Product product) {
    final wishlist = ref.watch(favoriteItemsProvider);
    return wishlist.contains(product);
  }

  bool toggleFavorite(Product product) {
    return ref.read(favoriteItemsProvider.notifier).toggleWishlistItem(product);
  }

  void addToCart(Product product){
    ref.read(cartItemsProvider.notifier).addProduct(product);
  }
}

final productViewModelProvider = Provider((ref) => ProductViewModel(ref));
