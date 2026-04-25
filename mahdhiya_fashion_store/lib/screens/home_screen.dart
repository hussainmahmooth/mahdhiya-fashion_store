import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Symbols.menu),
          onPressed: () {},
        ),
        title: Text(
          'MAHDHIYA FASHION',
          style: theme.textTheme.labelLarge?.copyWith(
            letterSpacing: 4.0,
            color: AppTheme.primary,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Symbols.search),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0.8),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Banner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1A237E).withOpacity(0.08),
                      blurRadius: 30,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBtS4_f2cGbiBUq3G81biEchxNxhqGxjI9wTky-C2oQ6Ju4xWl3aPH1JMfAgUCEW5F8lWzlRh37dGotcOz6DuG127b3fzT4gIpREsGDuWbgYvi07WR40HdIFA2BSB9xiHxf-Up1EjvkOnLDjh9lffX_w9IfZJFs5XLmdzPIyiNVqzTFkvUn1p4ITzs6LZjY6xl4mcLteXAtiO1jXIWnUh6chTOcXdqlLLdejnXGpwrABq22L9ja-NheAEVizpAc325duZnprRdGCRrF',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            AppTheme.primary.withOpacity(0.4),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ETHEREAL ELEGANCE',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 4.0,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'New Seasonal\nCollection',
                            style: theme.textTheme.displayLarge?.copyWith(
                              color: Colors.white,
                              height: 1.1,
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, '/product_listing'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primary,
                              foregroundColor: AppTheme.onPrimary,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text('EXPLORE NOW'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: const Color(0xFF1A237E),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryItem(context, 'Dresses', 'https://lh3.googleusercontent.com/aida-public/AB6AXuBaMk7Px_L2UzJibNmzyCl4zOfWnxMETuthIH9M1PaxnscxZzy0ke5yH13LHLknvbbAk7qr_ewNj1Yxow8wc6swN0W6lAbGNbG8D24NksPgrXZF04-UcJgP5mymtvj0ROluFeszroWA5ThvT8tFMw6mFBvCZ-w3ajiUehDdlck7OTTHOU3cbelnHbHw_1KJW99bqmrlqXEas12bHlu8ik5ZQSUpOk1lss9g-0JucYc7FysH-gZPL_O_ZaX889xB_8YsRkvWcDkUWF49'),
                  _buildCategoryItem(context, 'Tops', 'https://lh3.googleusercontent.com/aida-public/AB6AXuCE6YHNyogvtnzsQ0l6w_-T7qNR4x0pSYlY2CbMdNiFEAF_OELHDuE6W7lk_laJP5PkrtMhSxrybtMcJno-fJ4KvrYLFGgMb0AomLLLjJ6l2IZL6MqG-8Adz0q_Mk6Bu0CsIjeh5q9Rkig7XxjiXCX51eD4J4ityurvKZYVJVe95rwJxnUaBJEl5wr-r1AVvFR5PUZPvsqt3d-ILjUFfLhGQqpgSlnSyarOgpe4viM7OlNx6wulAi_LaZsGTO75EnOAT33H_xWT75hL'),
                  _buildCategoryItem(context, 'Outerwear', 'https://lh3.googleusercontent.com/aida-public/AB6AXuB7-GPyXz09DaXNPfR9ujiccHAUb_HY-hFvEXzLDAtGGuSaZpRXLcaCcGFAemGa5I5wjVV1aGQ3hiuh6K91Zk0BQR91T91P-7V4pW_EHrzdDqm9bPM_uwPUbSnegIjSMQB6S2OekKd4veav2hAkkp1Voa9zNHEUFoN1ieduDJUZKQb7EnET-8e3KIU6CJxzRrTMM0GEixXA-flNhhgMEUt8teK130wJAvWaw_-qA6pA2UK5JrTv1vtScWV9oNOLUvKScC6RdndBRLiH'),
                  _buildCategoryItem(context, 'Accessories', 'https://lh3.googleusercontent.com/aida-public/AB6AXuCyJeFgnT9zkbYuBaRlQXu2vg1NEp82aJJx6tb6a_sFvyx6tnLPrc77kMqnOhxfVjdab2MRX8Y1oQpDSe4rLF3h-WWEB1qQfeR0gi0jHN3f2PJzoXg2aR-FsuJYAj3YUyTzODjCB_JEB0JtoMwemNOVR5APJm3v8c-cZM08DJpZnAwdXwZXM2BQOafMqWbKJcf02OFnyhQexv28HG55JEPCUYoyNIzDx_NBDZCXztxr5LBMakt_ZMkZxPRsvz9K-0D9wtxmxavhrpK4'),
                ],
              ),
            ),
            // Trending Now
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trending Now',
                            style: theme.textTheme.headlineLarge?.copyWith(
                              color: const Color(0xFF1A237E),
                            ),
                          ),
                          Text(
                            'Curated styles that define the season',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/product_listing'),
                        child: const Text('VIEW ALL'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Consumer<AppProvider>(
                    builder: (context, provider, _) {
                      final products = provider.allProducts.take(4).toList();
                      return GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.7,
                        children: products.map((product) => _buildProductItem(
                          context, 
                          product.id, 
                          product.name, 
                          product.price, 
                          product.imageUrl,
                        )).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Member Exclusive
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF9AE1FF),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Member Exclusive',
                            style: theme.textTheme.displaySmall?.copyWith(
                              color: const Color(0xFF09657F),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Join the Mahdhiya Circle for 15% off your first seasonal order and early access to drops.',
                            style: TextStyle(
                              color: Color(0xFF0C6780),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, '/register'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text('JOIN THE CIRCLE'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuCtqsptQcJnlGa-0E1e9sSbysUlE2mbte_K1RbQyTnF_EuV2G90goEJKFQ6bNxOOQ07cCh8PTWN2PDD3pkSBnngCB-uaYHzZhvv2yKDNtr1HopZ0P0pTyLVmOvjP8rMLEqP7VQcQz-wzHAvsSI2Kae9a66Ri95LP0cQe09Hjwh2Qu5DkitrnqKycOw8pZgUz19axxLtPcQU4IIm7DRDM84uj__QEUCEB2Qucrkf8O-EfsONlfy1-RyrDxUHJBcjK8EqrYFzUnS7UjRW',
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 24, top: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1A237E).withOpacity(0.05),
              blurRadius: 24,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, Symbols.home, 'Home', true, '/home'),
            _buildNavItem(context, Symbols.storefront, 'Shop', false, '/product_listing'),
            _buildNavItem(context, Symbols.shopping_bag, 'Cart', false, '/cart'),
            _buildNavItem(context, Symbols.person, 'Profile', false, '/profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, String imageUrl) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product_listing'),
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF454652),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, String id, String title, String price, String imageUrl) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product_detail'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1A237E).withOpacity(0.03),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Consumer<AppProvider>(
                    builder: (context, provider, _) {
                      final isFavorite = provider.isInWishlist(id);
                      return GestureDetector(
                        onTap: () {
                          if (!provider.isLoggedIn) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Login Required'),
                                content: const Text('Please login to add items to your wishlist.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('CANCEL'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.primary,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text('LOGIN'),
                                  ),
                                ],
                              ),
                            );
                            return;
                          }
                          provider.toggleWishlist(id);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            size: 18,
                            color: isFavorite ? Colors.red : AppTheme.secondary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF001F29),
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppTheme.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, bool isActive, String route) {
    return GestureDetector(
      onTap: () {
        // Protected routes check
        if (route == '/cart' || route == '/profile' || route == '/wishlist') {
          final provider = context.read<AppProvider>();
          if (!provider.isLoggedIn) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Login Required'),
                content: Text('Please login to access your $label and other exclusive features.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('CANCEL'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('LOGIN'),
                  ),
                ],
              ),
            );
            return;
          }
        }
        Navigator.pushReplacementNamed(context, route);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? AppTheme.primary : const Color(0xFF9AE1FF),
            fill: isActive ? 1.0 : 0.0,
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: isActive ? AppTheme.primary : const Color(0xFF9AE1FF),
            ),
          ),
        ],
      ),
    );
  }
}
