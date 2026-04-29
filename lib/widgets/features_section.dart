import 'package:flutter/material.dart';
import 'package:landing_page_devops/theme/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      color: AppTheme.backgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Text(
                  'Tudo que você precisa',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Uma plataforma completa para quem joga e para quem gerencia.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 64),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 800;
                    return Wrap(
                      spacing: 32,
                      runSpacing: 32,
                      alignment: WrapAlignment.center,
                      children: [
                        SizedBox(
                          width: isMobile ? double.infinity : 350,
                          child: _FeatureCard(
                            icon: PhosphorIcons.calendar(),
                            title: 'Agenda em Tempo Real',
                            description: 'Veja a disponibilidade de todas as quadras da sua região instantaneamente.',
                          ),
                        ),
                        SizedBox(
                          width: isMobile ? double.infinity : 350,
                          child: _FeatureCard(
                            icon: PhosphorIcons.creditCard(),
                            title: 'Pagamento Seguro',
                            description: 'Rache o valor com amigos ou pague tudo online via PIX ou Cartão de Crédito.',
                          ),
                        ),
                        SizedBox(
                          width: isMobile ? double.infinity : 350,
                          child: _FeatureCard(
                            icon: PhosphorIcons.chatCircleDots(),
                            title: 'Chat Interno',
                            description: 'Comunique-se diretamente com o proprietário da quadra sem sair do app.',
                          ),
                        ),
                        SizedBox(
                          width: isMobile ? double.infinity : 350,
                          child: _FeatureCard(
                            icon: PhosphorIcons.users(),
                            title: 'Organização de Partidas',
                            description: 'Convide amigos, monte times e organize campeonatos facilmente.',
                          ),
                        ),
                        SizedBox(
                          width: isMobile ? double.infinity : 350,
                          child: _FeatureCard(
                            icon: PhosphorIcons.trendUp(),
                            title: 'Dashboard para Donos',
                            description: 'Gestão completa, relatórios financeiros e controle de acesso.',
                          ),
                        ),
                        SizedBox(
                          width: isMobile ? double.infinity : 350,
                          child: _FeatureCard(
                            icon: PhosphorIcons.shieldCheck(),
                            title: 'Confiabilidade',
                            description: 'Avaliações reais de outros jogadores para você escolher a melhor quadra.',
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryLight,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: AppTheme.primaryColor, size: 32),
          ),
          const SizedBox(height: 24),
          Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20)),
          const SizedBox(height: 12),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
