import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String category;
  final String price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
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
  final List<CartItem> _cartItems = [];
  final Set<String> _wishlistIds = {};

  // Master product list for the entire app
  final List<Product> _allProducts = [
    Product(
      id: 'azure-silk-midi',
      name: 'Azure Silk Midi',
      category: 'Dresses',
      price: r'$245.00',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA5EzU2UXCKJQSOI46LZtJe15tF_rLn9diF3m-SJfp08I06SZTt5aZzuteFSGJBoJ8h7pmoh31nZ2Sl8dhZQ_wEu90EyGSSBrrWVrJiK_D-qvDrxg7cAEENcCWrCZzUXauw7gzTeulVx_NT6rZzJ4r58XR7L12oqsSbpSesAOu1UXTP0sOZvUKLlke9Fn77_a1JHgj73awjVaMcTtw9zqVjTd9nUjDNcP0rjIWZt4Pik0sr0AqAq_JruQnzVV5aWz5WduythQ5X-CmJ',
    ),
    Product(
      id: 'flora-garden-gown',
      name: 'Flora Garden Gown',
      category: 'Dresses',
      price: r'$310.00',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBqyeSCrJBwkWMRkzLRl7YrCZpuXhJTfskxAQhKPIv7F5X5DL7H_HMuZZ2o-C8UXyRLdJJTafeBtg5FigzlIe1ILK9jHQlsVrE6vjTYW7FCWCxev4U_yn_pSZGeCvis75uPox4bD8sU491ugplijhaeyCBwMtW8naIiCAXjpLSneLyK8iyL9j3y6fuyYpl4DOk1XYHwr2uCsYJVRU_0gB3AiN58ViNqavs-y1ZFLRHPBQWnqrXY_ImFyKJvrV8H0qJP4TTN3JEYqzfZ',
    ),
    Product(
      id: 'citrus-knit-set',
      name: 'Citrus Knit Set',
      category: 'Tops',
      price: r'$185.00',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAiyDAoXff5L80Fn2RsDuHpKwl5aYfyZGECWIzEWj-WrkxLCsJDttf9DJgTq0CDqRWskup89BtR6zhb_QSLnW17Co2Y_4Xy6v-jHJrmtmDRKEPOK8V4jmN2dFnaYNXFmj-bOBrUzYEP6P-sbxjQNnrgrbeTVKtwFQaP_9XgYHe3EIauB3FMv9DqECFaNlVeiICq7fh3QyCZN1GPEDZFaVhXp_jpXabhJAASvK0UReTcTOuLNr5y95MtdJGLTtGM4haV-VAT8Mjrjq62',
    ),
    Product(
      id: 'indigo-structure',
      name: 'Indigo Structure',
      category: 'Dresses',
      price: r'$420.00',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAP2TnYsNXDcg0gWG-EAcCk-E8wlAQPdE9B-O79n4y9lpxTgKQjBeAxmNyMOcNU2GNjz-gzjg-cDoAwzily76q0cSDqHxrmhb1ibEiaxS41-aLs0sJxAnArawPYYRcxtdUuev99313orm-kNklA5FeIVHk-lavncKAGIHorhwnM3O0erzKCIVvrGfO7C_xNsZeC5V1bUzsSrv7ecINmvVDrx5_BzWeIS2ohf1PG9cStVYRbyX8iPaw_6B8cwUUobBmpSM7KocdLMosB',
    ),
    Product(
      id: 'structured-overcoat',
      name: 'STRUCTURED OVERCOAT',
      category: 'Outerwear',
      price: r'$1,250.00',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuByd_QlLwYUuio3GYJkGROk_WqxOf5vwwghNM59Duy0wCUUw_iLIbDKda3DR3z7w6suKnqRYY3A1FujfZVJ670iwJSCMNVvwT-yDj2Xigda56Vv3ppzMJQp3LLOXqLtnUtwrtXbXTxSfblYFFP2z6IQF1RsFlZGy9MNNiqPnEl0hryxr4bpwqDK5Th43NWNVVT0f5ZV9pU-asF_EDrGOZym8Byu8JIXYQYfLKqbKJbyxbN7WeUafdpMm8XQLE4yJcU2a0vznO3Im6dV',
    ),
    Product(
      id: 'silk-midi-dress',
      name: 'Silk Wrap Midi Dress',
      category: 'Dresses',
      price: r'$129.00',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuARlxH4JLTDeSMu3rQLieuzQsZPie3Ww2EcEgU8KZvuJfLqG3Kt2eZmrYE4nHtH64qZWD-JU6iTkBoo0-2iFz3psLBK7cFAdo6WSJ0OYxmV9eedD4DtHWtpYk4CO1P7TqyM0r-XTbBCGVAIcYOn-zPdIhRWFRZMqiCEqp5cHf5V7xBjNI2-fpJ-udiS9-jm3V_NYd0YJ81j7Uf_12VsPQhtfO7tRxg5daVRhKA-8506Of8_zGdEZpbFOR-7RbcTgGfklAAuyKhcxJ_0',
    ),
  ];

  bool get isLoggedIn => _isLoggedIn;
  List<CartItem> get cartItems => _cartItems;
  Set<String> get wishlistIds => _wishlistIds;
  List<Product> get allProducts => _allProducts;

  List<Product> get wishlistProducts {
    return _allProducts.where((p) => _wishlistIds.contains(p.id)).toList();
  }

  // Auth Methods
  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
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
