import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.8),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF1A237E)),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.8),
              child: Consumer<AppProvider>(
                builder: (context, provider, _) {
                  final isWishlisted = provider.isInWishlist('silk-midi-dress');
                  return IconButton(
                    icon: Icon(
                      isWishlisted ? Icons.favorite : Icons.favorite_border,
                      color: isWishlisted ? Colors.red : AppTheme.secondary,
                    ),
                    onPressed: () => provider.toggleWishlist('silk-midi-dress'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Gallery
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Stack(
                children: [
                  PageView(
                    children: [
                      Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuARlxH4JLTDeSMu3rQLieuzQsZPie3Ww2EcEgU8KZvuJfLqG3Kt2eZmrYE4nHtH64qZWD-JU6iTkBoo0-2iFz3psLBK7cFAdo6WSJ0OYxmV9eedD4DtHWtpYk4CO1P7TqyM0r-XTbBCGVAIcYOn-zPdIhRWFRZMqiCEqp5cHf5V7xBjNI2-fpJ-udiS9-jm3V_NYd0YJ81j7Uf_12VsPQhtfO7tRxg5daVRhKA-8506Of8_zGdEZpbFOR-7RbcTgGfklAAuyKhcxJ_0',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCEXme-YUnVY3uVm2xUywBZlsLOmOfFwSn1moXBPtB0ViYHtIe_PE3WfgSl6ZVgwwxdGKXKdpcKxtFVQGa-3Ae03OTlehJrH9jaRyuIA3K4VCih777r1wBr7hmcdr5wEpaWyNKERIfjjVOMMqdgPt0PrLiJgelzZ98UQXcPuU_F32ENeX_1eOyLzZAthCLjvLmX7NiBbYeD6KQO2hsr3U0QInyIbGUAxwbW_sdTZZoneXd6sxj6nunNA_Q9lAEu63xaonxbzI1D2-f9',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 24,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppTheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NEW ARRIVAL',
                    style: textTheme.labelLarge?.copyWith(
                      color: AppTheme.secondary,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Silk Wrap Midi Dress',
                    style: textTheme.headlineLarge?.copyWith(
                      color: const Color(0xFF1A237E),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    r'$129.00',
                    style: textTheme.headlineMedium?.copyWith(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Color Selection
                  Text(
                    'COLOR: NAVY',
                    style: textTheme.labelLarge?.copyWith(
                      color: AppTheme.onSurface,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _ColorOption(color: const Color(0xFF000666), isSelected: true),
                      const SizedBox(width: 12),
                      _ColorOption(color: const Color(0xFF87CEEB)),
                      const SizedBox(width: 12),
                      _ColorOption(color: const Color(0xFFB0E0E6)),
                    ],
                  ),
                  const SizedBox(height: 32),
                  
                  // Size Selection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SIZE',
                        style: textTheme.labelLarge?.copyWith(
                          color: AppTheme.onSurface,
                          letterSpacing: 1.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Size Guide',
                          style: TextStyle(
                            color: AppTheme.secondary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _SizeOption(label: 'XS'),
                      _SizeOption(label: 'S', isSelected: true),
                      _SizeOption(label: 'M'),
                      _SizeOption(label: 'L'),
                      _SizeOption(label: 'XL'),
                    ],
                  ),
                  const SizedBox(height: 40),
                  
                  // Collapsible Sections
                  _DetailSection(
                    title: 'Description',
                    content: 'Crafted from premium heavy-weight mulberry silk, this midi dress features a classic wrap silhouette that defines the waist and flows elegantly into a soft A-line skirt. Perfect for both evening events and refined daytime looks.',
                    isOpen: true,
                  ),
                  _DetailSection(title: 'Material & Care', content: '100% Mulberry Silk. Dry clean only.'),
                  _DetailSection(title: 'Shipping', content: 'Free standard shipping on all orders over \$200.'),
                  
                  const SizedBox(height: 40),
                  
                  // Complete The Look
                  Text(
                    'Complete The Look',
                    style: textTheme.headlineMedium?.copyWith(
                      color: const Color(0xFF1A237E),
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        _RelatedProductCard(
                          name: 'Silk Pointed Heels',
                          price: r'$185.00',
                          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDv0kcPErFyvco1hXBR_2lSS4-XEzzQ-MLIJv55ww1wPLI4AkpzdZFSRU87OsKXqwGQDM-i9fUq0Z0QRyJp3ksNuNeurNdclnpKSWGuOdXXn05T4mQes_QKQ6XNl0dUerrhDfQ0OHKzMhNBElH_nHQkyFWDoIoU4quPt393qHjhW_mZiDLmT-cSre35itZiT4BDpWcOVIqoPNJLuHk0HnLqlphfHZox2JCeFTWAAHLPAkDsJ-QxxOvjwP1jHtYTCweaE76c55wl0BwH',
                        ),
                        SizedBox(width: 16),
                        _RelatedProductCard(
                          name: 'Petite Leather Clutch',
                          price: r'$240.00',
                          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD2l8tT5gF1qQ_3d_q5mcEFGbZhQBC8GyOrWDa8cgPTg9PB5yCgIxX7ux-pHk9FAy0oJDvN0whgHOxpxZepuWanjVpJj55gdFlrQHOkkJmcmNX-M4jY3NMOhdISvLC9REQ0tdvIHfGUzImcxmvqURFtdtv0NgjFgcTPbG949-RDT2FckrohG0GQwvY580zRtWKGomXyoZX67oRLx28zmHCNuRiQhQ-sRrwcAvKMGBYsydPZmppe_lI3ongzU20U5w353ZOpKfRZK-F5',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            final provider = context.read<AppProvider>();
            if (!provider.isLoggedIn) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Login Required'),
                  content: const Text('Please login to your account to add items to your cart and proceed with your purchase.'),
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
            provider.addToCart(
              'silk-midi-dress',
              'Silk Wrap Midi Dress',
              r'$129.00',
              'https://lh3.googleusercontent.com/aida-public/AB6AXuARlxH4JLTDeSMu3rQLieuzQsZPie3Ww2EcEgU8KZvuJfLqG3Kt2eZmrYE4nHtH64qZWD-JU6iTkBoo0-2iFz3psLBK7cFAdo6WSJ0OYxmV9eedD4DtHWtpYk4CO1P7TqyM0r-XTbBCGVAIcYOn-zPdIhRWFRZMqiCEqp5cHf5V7xBjNI2-fpJ-udiS9-jm3V_NYd0YJ81j7Uf_12VsPQhtfO7tRxg5daVRhKA-8506Of8_zGdEZpbFOR-7RbcTgGfklAAuyKhcxJ_0',
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Added to Cart')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 64),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'ADD TO CART',
            style: textTheme.labelLarge?.copyWith(
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}

class _ColorOption extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const _ColorOption({required this.color, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? const Color(0xFF1A237E) : Colors.transparent,
          width: 2,
        ),
      ),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _SizeOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  const _SizeOption({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF0F7FF) : Colors.transparent,
        border: Border.all(
          color: isSelected ? const Color(0xFF1A237E) : const Color(0xFFC6C5D4).withOpacity(0.5),
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? const Color(0xFF1A237E) : AppTheme.onSurface,
          ),
        ),
      ),
    );
  }
}

class _DetailSection extends StatelessWidget {
  final String title;
  final String content;
  final bool isOpen;

  const _DetailSection({
    required this.title,
    required this.content,
    this.isOpen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: const Color(0xFF1A237E).withOpacity(0.05)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                  color: Color(0xFF1A237E),
                ),
              ),
              Icon(
                isOpen ? Icons.remove : Icons.add,
                size: 20,
                color: AppTheme.outline,
              ),
            ],
          ),
          if (isOpen) ...[
            const SizedBox(height: 16),
            Text(
              content,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                height: 1.6,
                color: AppTheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _RelatedProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const _RelatedProductCard({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFF6F3F2),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A237E),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: TextStyle(color: AppTheme.outline),
          ),
        ],
      ),
    );
  }
}
