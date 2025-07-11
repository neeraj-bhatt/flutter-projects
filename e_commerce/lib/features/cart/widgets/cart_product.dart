import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:e_commerce/features/cart/model/cart_item.dart';
import 'package:e_commerce/features/cart/viewmodel/cart_view_model.dart';

class CartProduct extends ConsumerWidget {
  final CartItem item;
  const CartProduct({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(cartViewModelProvider);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: item.product.image,
              height: 100,
              width: 100,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.title,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        'Price : ${item.product.price.toStringAsFixed(2)}',
                      ),
                      const Spacer(),
                      Text(
                          'Total : ${(item.product.price * item.quantity).toStringAsFixed(2)}'),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          vm.removeFromCart(item.product);
                        },
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18.0),
                              bottomLeft: Radius.circular(18.0),
                              topRight: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                            ),
                          ),
                          backgroundColor: Colors.blueGrey.shade50,
                        ),
                        icon: Icon(Icons.remove),
                      ),
                      const SizedBox(width: 8.0),
                      Text('${item.quantity}'),
                      const SizedBox(width: 8.0),
                      IconButton(
                          onPressed: () {
                            vm.addToCart(item.product);
                          },
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.0),
                                bottomLeft: Radius.circular(0.0),
                                topRight: Radius.circular(18.0),
                                bottomRight: Radius.circular(18.0),
                              ),
                            ),
                            backgroundColor: Colors.yellow,
                          ),
                          icon: Icon(Icons.add)),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Colors.greenAccent.shade700),
                        ),
                        child: Text(
                          'Buy',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
