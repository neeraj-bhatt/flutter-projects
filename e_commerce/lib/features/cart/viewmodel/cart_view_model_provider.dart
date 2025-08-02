import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'package:e_commerce/features/cart/model/hive_cart_item.dart';
import 'package:e_commerce/features/cart/service/cart_local_service.dart';
import 'package:e_commerce/features/cart/viewmodel/cart_view_model.dart';
import 'package:e_commerce/features/cart/model/cart_item.dart';

final cartBoxProvider =
    Provider<Box<HiveCartItem>>((ref) => throw UnimplementedError());

final cartLocalServiceProvider =
    Provider((ref) => CartLocalService(ref.watch(cartBoxProvider)));

final cartViewModelProvider =
    StateNotifierProvider<CartViewModel, List<CartItem>>(
        (ref) => CartViewModel(ref.watch(cartLocalServiceProvider)));
