import 'package:flutter/material.dart';
import 'package:landing_page_devops/widgets/navbar.dart';
import 'package:landing_page_devops/widgets/hero_section.dart';
import 'package:landing_page_devops/widgets/how_it_works_section.dart';
import 'package:landing_page_devops/widgets/features_section.dart';
import 'package:landing_page_devops/widgets/courts_section.dart';
import 'package:landing_page_devops/widgets/contact_footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 50 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (_scrollController.offset <= 50 && _isScrolled) {
      setState(() => _isScrolled = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: const [
                HeroSection(),
                HowItWorksSection(),
                FeaturesSection(),
                CourtsSection(),
                ContactFooter(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(isScrolled: _isScrolled),
          ),
        ],
      ),
    );
  }
}
