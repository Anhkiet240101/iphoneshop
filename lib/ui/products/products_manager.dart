import '../../models/product.dart';

import 'package:flutter/foundation.dart';

class ProductsManager with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Iphone 14 Pro Max',
      description: 'A red shirt - it is pretty red!',
      price: 1350.40,
      imageUrl:
          'https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/147816/Originals/iPhone-14-Pro-11.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p2',
      title: 'Iphone 14 Pro',
      description: 'A nice pair of trousers.',
      price: 1229.47,
      imageUrl:
          'https://minmobile.net/image/catalog/iPhone/iPhone-14-series/iphone-14-promax-256-mau-vang-gia-re-tai-hai-phong.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Iphone 14 Plus',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 1040.01,
      imageUrl: '',
    ),
    Product(
      id: 'p4',
      title: 'Iphone 14',
      description: 'Prepare any meal you want.',
      price: 919.08,
      imageUrl: '',
      isFavorite: true,
    ),
    Product(
      id: 'p5',
      title: 'Iphone 13 Pro Max',
      description: 'Prepare any meal you want.',
      price: 1148.85,
      imageUrl:
          'https://cdn.tgdd.vn/Products/Images/42/250261/iphone-13-pro-max-xanh-la-thumb-600x600.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p6',
      title: 'Iphone 13 Pro',
      description: 'Prepare any meal you want.',
      price: 1048.07,
      imageUrl: '',
      isFavorite: true,
    ),
    Product(
      id: 'p7',
      title: 'Iphone 13',
      description: 'Prepare any meal you want.',
      price: 806.21,
      imageUrl: '',
      isFavorite: true,
    ),
    Product(
      id: 'p8',
      title: 'Iphone 12',
      description: 'Prepare any meal you want.',
      price: 685.28,
      imageUrl: '',
      isFavorite: true,
    ),
  ];

  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    _items.add(
      product.copyWith(
        id: 'p${DateTime.now().toIso8601String()}',
      ),
    );
    notifyListeners();
  }

  void updateProduct(Product product) {
    final index = _items.indexWhere((item) => item.id == product.id);
    if (index > 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void toggleFavoriteStatus(Product product) {
    final saveStatus = product.isFavorite;
    product.isFavorite = !saveStatus;
  }

  void deleteProduct(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    _items.removeAt(index);
    notifyListeners();
  }
}
