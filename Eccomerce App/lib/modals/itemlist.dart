import 'package:flutter/cupertino.dart';
import 'package:task_1_zairza/modals/products.dart';

import 'itemlist_card.dart';

class ItemsList extends StatelessWidget {
  ItemsList({required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ItemCard(
              product: products[index],
            );
          },
        ),
      ),
    );
  }
}
