import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String category;
  final String price;
  final String imageUrl;
  final String description;
  final double rating;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.description = 'A meticulously crafted piece from our latest collection, designed for the modern individual who values both elegance and comfort. Made with premium materials and attention to detail.',
    this.rating = 4.8,
  });
}

class CartItem {
  final String id;
  final String name;
  final String price;
  final String imageUrl;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  double get priceValue {
    return double.parse(price.replaceAll(r'$', '').replaceAll(',', ''));
  }
}

class AppProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _userName = 'Guest';
  String _userEmail = 'guest@mahdhiya.com';
  final List<CartItem> _cartItems = [];
  final Set<String> _wishlistIds = {};

  // Master product list for the entire app
  final List<Product> _allProducts = [
    Product(
      id: 'azure-silk-midi',
      name: 'Azure Silk Midi',
      category: 'Dresses',
      price: r'$245.00',
      imageUrl: 'assets/images/azure_silk_midi.jpg',
    ),
    Product(
      id: 'flora-garden-gown',
      name: 'Flora Garden Gown',
      category: 'Dresses',
      price: r'$310.00',
      imageUrl: 'assets/images/flora_garden_gown.jpg',
    ),
    Product(
      id: 'citrus-knit-set',
      name: 'Citrus Knit Set',
      category: 'Tops',
      price: r'$185.00',
      imageUrl: 'assets/images/citrus_knit_set.jpg',
    ),
    Product(
      id: 'indigo-structure',
      name: 'Indigo Structure',
      category: 'Dresses',
      price: r'$420.00',
      imageUrl: 'assets/images/indigo_structure.jpg',
    ),
    Product(
      id: 'structured-overcoat',
      name: 'STRUCTURED OVERCOAT',
      category: 'Outerwear',
      price: r'$1,250.00',
      imageUrl: 'assets/images/structured_overcoat.jpg',
    ),
    Product(
      id: 'silk-midi-dress',
      name: 'Silk Wrap Midi Dress',
      category: 'Dresses',
      price: r'$129.00',
      imageUrl: 'assets/images/silk_wrap_midi_dress.jpg',
    ),
  ];

  bool get isLoggedIn => _isLoggedIn;
  List<CartItem> get cartItems => _cartItems;
  Set<String> get wishlistIds => _wishlistIds;
  List<Product> get allProducts => _allProducts;

  List<Product> get wishlistProducts {
    return _allProducts.where((p) => _wishlistIds.contains(p.id)).toList();
  }

  Product getProductById(String id) {
    return _allProducts.firstWhere(
      (p) => p.id == id,
      orElse: () => _allProducts.first,
    );
  }

  // Auth Methods
  void login(String email, [String? name]) {
    _isLoggedIn = true;
    _userEmail = email;
    if (name != null) _userName = name;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _userName = 'Guest';
    _userEmail = 'guest@mahdhiya.com';
    _cartItems.clear();
    _wishlistIds.clear();
    notifyListeners();
  }

  // Cart Methods
  void addToCart(String id, String name, String price, String imageUrl) {
    final index = _cartItems.indexWhere((item) => item.id == id);
    if (index >= 0) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(id: id, name: name, price: price, imageUrl: imageUrl));
    }
    notifyListeners();
  }

  void removeFromCart(String id) {
    _cartItems.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void updateQuantity(String id, int delta) {
    final index = _cartItems.indexWhere((item) => item.id == id);
    if (index >= 0) {
      _cartItems[index].quantity += delta;
      if (_cartItems[index].quantity <= 0) {
        _cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  double get cartTotal {
    return _cartItems.fold(0, (total, item) => total + (item.priceValue * item.quantity));
  }

  // Wishlist Methods
  void toggleWishlist(String id) {
    if (_wishlistIds.contains(id)) {
      _wishlistIds.remove(id);
    } else {
      _wishlistIds.add(id);
    }
    notifyListeners();
  }

  bool isInWishlist(String id) => _wishlistIds.contains(id);
}
