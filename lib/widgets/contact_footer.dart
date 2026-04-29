import 'package:flutter/material.dart';
import 'package:landing_page_devops/theme/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ContactFooter extends StatelessWidget {
  const ContactFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF111111),
      padding: const EdgeInsets.only(top: 80, bottom: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 800;
                    if (isMobile) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBrandColumn(context),
                          const SizedBox(height: 48),
                          _buildLinksColumn('Produto', ['Funcionalidades', 'Preços', 'Quadras', 'Avaliações']),
                          const SizedBox(height: 32),
                          _buildLinksColumn('Empresa', ['Sobre nós', 'Carreiras', 'Blog', 'Contato']),
                          const SizedBox(height: 32),
                          _buildSocialColumn(),
                        ],
                      );
                    }
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 2, child: _buildBrandColumn(context)),
                        Expanded(child: _buildLinksColumn('Produto', ['Funcionalidades', 'Preços', 'Quadras', 'Avaliações'])),
                        Expanded(child: _buildLinksColumn('Empresa', ['Sobre nós', 'Carreiras', 'Blog', 'Contato'])),
                        Expanded(child: _buildSocialColumn()),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 64),
                Divider(color: Colors.grey.shade800),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '© 2026 SportBnb. Todos os direitos reservados.',
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                    ),
                    Row(
                      children: [
                        Text('Termos de Uso', style: TextStyle(color: Colors.grey.shade500, fontSize: 14)),
                        const SizedBox(width: 16),
                        Text('Privacidade', style: TextStyle(color: Colors.grey.shade500, fontSize: 14)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrandColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(PhosphorIcons.tennisBall(PhosphorIconsStyle.fill), color: AppTheme.primaryColor, size: 32),
            const SizedBox(width: 12),
            Text(
              'SportBnb',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'A plataforma líder para aluguel de quadras esportivas e conexão de atletas.',
          style: TextStyle(color: Colors.grey.shade400, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildLinksColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 24),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                link,
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildSocialColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Siga-nos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            _SocialIcon(icon: PhosphorIcons.instagramLogo()),
            const SizedBox(width: 16),
            _SocialIcon(icon: PhosphorIcons.twitterLogo()),
            const SizedBox(width: 16),
            _SocialIcon(icon: PhosphorIcons.linkedinLogo()),
          ],
        ),
        const SizedBox(height: 32),
        const Text(
          'Baixe o App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Icon(PhosphorIcons.appleLogo(PhosphorIconsStyle.fill), color: Colors.white, size: 32),
            const SizedBox(width: 16),
            Icon(PhosphorIcons.googlePlayLogo(PhosphorIconsStyle.fill), color: Colors.white, size: 32),
          ],
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;

  const _SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }
}
