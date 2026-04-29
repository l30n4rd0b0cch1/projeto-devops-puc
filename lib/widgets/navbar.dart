import 'package:flutter/material.dart';
import 'package:landing_page_devops/theme/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Navbar extends StatelessWidget {
  final bool isScrolled;

  const Navbar({super.key, required this.isScrolled});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 80,
      decoration: BoxDecoration(
        color: isScrolled ? Colors.white.withValues(alpha: 0.95) : Colors.transparent,
        boxShadow: isScrolled
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ]
            : [],
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      PhosphorIcons.tennisBall(PhosphorIconsStyle.fill),
                      color: isScrolled ? AppTheme.primaryColor : Colors.white,
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'SportBnb',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: isScrolled ? AppTheme.textColor : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                if (MediaQuery.of(context).size.width > 800)
                  Row(
                    children: [
                      _NavItem('Como Funciona', isScrolled: isScrolled),
                      _NavItem('Funcionalidades', isScrolled: isScrolled),
                      _NavItem('Quadras', isScrolled: isScrolled),
                      const SizedBox(width: 24),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: isScrolled ? AppTheme.primaryColor : Colors.white,
                          side: BorderSide(
                            color: isScrolled ? AppTheme.primaryColor : Colors.white,
                            width: 2,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        ),
                        child: const Text('Entrar'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isScrolled ? AppTheme.primaryColor : Colors.white,
                          foregroundColor: isScrolled ? Colors.white : AppTheme.primaryColor,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        ),
                        child: const Text('Criar Conta'),
                      ),
                    ],
                  )
                else
                  IconButton(
                    icon: Icon(
                      PhosphorIcons.list(),
                      color: isScrolled ? AppTheme.textColor : Colors.white,
                    ),
                    onPressed: () {},
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final bool isScrolled;

  const _NavItem(this.title, {required this.isScrolled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: isScrolled ? AppTheme.textColor : Colors.white,
        ),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
