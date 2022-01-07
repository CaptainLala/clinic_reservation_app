import 'package:clinic_reservation_app/models/products.dart';
import 'package:flutter/cupertino.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Otrivin Nasal Spray',
      image: 'assets/images/nasal_spray.png',
      detail: 'Otrivin brand Nasal Spray for nasal infection.',
      price: 25,
    ),
    Product(
      id: 2,
      name: 'Refinee Skin Care',
      image: 'assets/images/skin_care.png',
      detail: 'Refinee brand skin cream for age recovery.',
      price: 40,
    ),
    Product(
      id: 3,
      name: 'Multivitamin',
      image: 'assets/images/vitamin.png',
      detail: 'NewChapter brand multivitamin for daily uses.',
      price: 15,
    ),
  ];

  List<Product> get items {
    return [..._products];
  }
}
