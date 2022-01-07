import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/providers/products_provider.dart';
import 'package:clinic_reservation_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = '/products';
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products =
        Provider.of<ProductsProvider>(context, listen: false).items;
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Our Products',
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
          );
        },
      ),
    );
  }
}
