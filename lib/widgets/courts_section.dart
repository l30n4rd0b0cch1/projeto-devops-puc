import 'package:flutter/material.dart';
import 'package:landing_page_devops/theme/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CourtsSection extends StatelessWidget {
  const CourtsSection({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quadras em Destaque',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'As melhores opções selecionadas para sua próxima partida.',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    if (MediaQuery.of(context).size.width > 600)
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(foregroundColor: AppTheme.primaryColor),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Ver todas as quadras', style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            Icon(PhosphorIcons.arrowRight(), size: 18),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 48),
                LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
                    return GridView.count(
                      crossAxisCount: crossAxisCount,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 32,
                      crossAxisSpacing: 32,
                      childAspectRatio: 0.8,
                      children: [
                        _CourtCard(
                          imageUrl: 'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?q=80&w=1035&auto=format&fit=crop',
                          title: 'Arena Society Premium',
                          location: 'São Paulo, SP',
                          price: 'R\$ 150/h',
                          rating: 4.9,
                          sport: 'Futebol Society',
                        ),
                        _CourtCard(
                          imageUrl: 'https://images.unsplash.com/photo-1595435934249-5df7ed86e1c0?q=80&w=1176&auto=format&fit=crop',
                          title: 'Clube de Tênis Ace',
                          location: 'Campinas, SP',
                          price: 'R\$ 90/h',
                          rating: 4.8,
                          sport: 'Tênis',
                        ),
                        _CourtCard(
                          imageUrl: 'https://images.unsplash.com/photo-1544365558-35aa4afcf11f?q=80&w=1036&auto=format&fit=crop',
                          title: 'Quadra Poliesportiva Central',
                          location: 'Belo Horizonte, MG',
                          price: 'R\$ 120/h',
                          rating: 4.7,
                          sport: 'Vôlei/Basquete',
                        ),
                      ],
                    );
                  },
                ),
                if (MediaQuery.of(context).size.width <= 600) ...[
                  const SizedBox(height: 32),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(foregroundColor: AppTheme.primaryColor),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Ver todas as quadras', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          Icon(PhosphorIcons.arrowRight(), size: 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CourtCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String price;
  final double rating;
  final String sport;

  const _CourtCard({
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.sport,
  });

  @override
  State<_CourtCard> createState() => _CourtCardState();
}

class _CourtCardState extends State<_CourtCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -10 : 0, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.1 : 0.05),
              blurRadius: _isHovered ? 30 : 15,
              offset: Offset(0, _isHovered ? 15 : 5),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              widget.rating.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.sport,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(PhosphorIcons.mapPin(), color: Colors.grey, size: 16),
                          const SizedBox(width: 4),
                          Text(widget.location, style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.price,
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              textStyle: const TextStyle(fontSize: 14),
                            ),
                            child: const Text('Reservar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
