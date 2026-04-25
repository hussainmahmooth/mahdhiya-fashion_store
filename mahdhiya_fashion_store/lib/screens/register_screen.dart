import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topRight,
            radius: 1.5,
            colors: [
              Color(0xFFF0F7FF),
              Color(0xFFFFFFFF),
              Color(0xFFF5F9FF),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Background Decorative Elements
            Positioned(
              bottom: -100,
              left: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: AppTheme.secondary.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: AppTheme.primary.withOpacity(0.03),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            
            Column(
              children: [
                // Top App Bar
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 16,
                    bottom: 16,
                    left: 24,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    border: Border(
                      bottom: BorderSide(
                        color: const Color(0xFF1A237E).withOpacity(0.05),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back),
                            color: const Color(0xFF1A237E),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'MAHDHIYA FASHION',
                            style: textTheme.labelLarge?.copyWith(
                              letterSpacing: 2.0,
                              color: AppTheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.search, color: Color(0xFF1A237E)),
                    ],
                  ),
                ),
                
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        // Form Card
                        Container(
                          padding: const EdgeInsets.all(32.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.white.withOpacity(0.5)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF1A237E).withOpacity(0.04),
                                blurRadius: 32,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Create Account',
                                style: textTheme.headlineLarge?.copyWith(
                                  color: AppTheme.primary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Step into a world of serene sophistication.',
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppTheme.outline,
                                ),
                              ),
                              const SizedBox(height: 32),
                              
                              // Full Name Field
                              const _Label(text: 'Full Name'),
                              const SizedBox(height: 8),
                              const _TextField(
                                hint: 'Evelyn Harper',
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(height: 20),
                              
                              // Email Field
                              const _Label(text: 'Email'),
                              const SizedBox(height: 8),
                              const _TextField(
                                hint: 'evelyn@fashion.com',
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 20),
                              
                              // Password Fields
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        _Label(text: 'Password'),
                                        SizedBox(height: 8),
                                        _TextField(
                                          hint: '••••••••',
                                          obscureText: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        _Label(text: 'Confirm'),
                                        SizedBox(height: 8),
                                        _TextField(
                                          hint: '••••••••',
                                          obscureText: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              
                              // Terms Checkbox
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Checkbox(
                                      value: false,
                                      onChanged: (val) {},
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      side: BorderSide(
                                        color: AppTheme.secondary.withOpacity(0.3),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: textTheme.bodySmall?.copyWith(
                                          color: AppTheme.outline,
                                          height: 1.5,
                                        ),
                                        children: [
                                          const TextSpan(text: 'I agree to the '),
                                          TextSpan(
                                            text: 'Terms and Conditions',
                                            style: TextStyle(
                                              color: AppTheme.secondary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const TextSpan(text: ' and '),
                                          TextSpan(
                                            text: 'Privacy Policy',
                                            style: TextStyle(
                                              color: AppTheme.secondary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const TextSpan(text: '.'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 32),
                              
                              // Sign Up Button
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.primary,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(double.infinity, 56),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 8,
                                  shadowColor: AppTheme.primary.withOpacity(0.2),
                                ),
                                child: Text(
                                  'SIGN UP',
                                  style: textTheme.labelLarge?.copyWith(
                                    letterSpacing: 2.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              
                              // Sign In Link
                              Center(
                                child: GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: RichText(
                                    text: TextSpan(
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppTheme.outline,
                                      ),
                                      children: [
                                        const TextSpan(text: 'Already have an account? '),
                                        TextSpan(
                                          text: 'Sign In',
                                          style: TextStyle(
                                            color: AppTheme.primary,
                                            fontWeight: FontWeight.w600,
                                            decoration: TextDecoration.underline,
                                            decorationColor: AppTheme.secondary.withOpacity(0.3),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: AppTheme.primary,
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;

  const _TextField({
    required this.hint,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppTheme.outline.withOpacity(0.5)),
        filled: true,
        fillColor: Colors.white.withOpacity(0.5),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.secondary.withOpacity(0.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.secondary.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppTheme.secondary, width: 2),
        ),
      ),
    );
  }
}
