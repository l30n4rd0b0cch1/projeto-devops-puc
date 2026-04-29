import 'package:flutter/material.dart';
import 'package:landing_page_devops/theme/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Text(
                  'Como Funciona',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Sua partida em 3 passos simples',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 64),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 800) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _StepCard(number: '1', title: 'Encontre', description: 'Busque quadras por esporte, localização e data. Veja fotos e avaliações reais.', icon: PhosphorIcons.mapPin())),
                          _buildConnector(),
                          Expanded(child: _StepCard(number: '2', title: 'Reserve', description: 'Escolha o melhor horário na agenda em tempo real e confirme sua reserva.', icon: PhosphorIcons.calendarCheck())),
                          _buildConnector(),
                          Expanded(child: _StepCard(number: '3', title: 'Jogue', description: 'Pague online com segurança e vá direto para a quadra. Divirta-se!', icon: PhosphorIcons.soccerBall())),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          _StepCard(number: '1', title: 'Encontre', description: 'Busque quadras por esporte, localização e data.', icon: PhosphorIcons.mapPin()),
                          const SizedBox(height: 40),
                          _StepCard(number: '2', title: 'Reserve', description: 'Escolha o melhor horário na agenda em tempo real.', icon: PhosphorIcons.calendarCheck()),
                          const SizedBox(height: 40),
                          _StepCard(number: '3', title: 'Jogue', description: 'Pague online e vá direto para a quadra.', icon: PhosphorIcons.soccerBall()),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConnector() {
    return Container(
      height: 2,
      width: 50,
      margin: const EdgeInsets.only(top: 40),
      color: Colors.grey.shade300,
    );
  }
}

class _StepCard extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final IconData icon;

  const _StepCard({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppTheme.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppTheme.primaryColor, size: 40),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: Center(
                child: Text(
                  number,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
