import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:landing_page_devops/theme/app_theme.dart';
import 'package:landing_page_devops/widgets/navbar.dart';
import 'package:landing_page_devops/widgets/how_it_works_section.dart';
import 'package:landing_page_devops/widgets/features_section.dart';
import 'package:landing_page_devops/widgets/contact_footer.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: Scaffold(body: widget),
    );
  }

  testWidgets('Navbar renderiza links e botões em tela grande (Desktop)', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      buildTestableWidget(const Navbar(isScrolled: false)),
    );
    await tester.pumpAndSettle();
    expect(find.text('SportBnb'), findsOneWidget);
    expect(find.text('Como Funciona'), findsOneWidget);
    expect(find.text('Funcionalidades'), findsOneWidget);
    expect(find.text('Quadras'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
    expect(find.text('Criar Conta'), findsOneWidget);
    expect(find.byType(IconButton), findsNothing);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });

  testWidgets(
    'Navbar oculta links e exibe menu Hamburger em tela pequena (Mobile)',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        buildTestableWidget(const Navbar(isScrolled: false)),
      );
      await tester.pumpAndSettle();
      expect(find.text('SportBnb'), findsOneWidget);
      expect(find.text('Como Funciona'), findsNothing);
      expect(find.text('Criar Conta'), findsNothing);
      expect(find.byType(IconButton), findsOneWidget);

      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
    },
  );

  testWidgets('HowItWorksSection deve renderizar os três passos principais', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      buildTestableWidget(
        const SingleChildScrollView(child: HowItWorksSection()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Como Funciona'), findsOneWidget);
    expect(find.text('Sua partida em 3 passos simples'), findsOneWidget);
    expect(find.text('Encontre'), findsOneWidget);
    expect(find.text('Reserve'), findsOneWidget);
    expect(find.text('Jogue'), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });

  testWidgets('FeaturesSection deve listar todos os benefícios', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      buildTestableWidget(
        const SingleChildScrollView(child: FeaturesSection()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Tudo que você precisa'), findsOneWidget);
    expect(find.text('Agenda em Tempo Real'), findsOneWidget);
    expect(find.text('Pagamento Seguro'), findsOneWidget);
    expect(find.text('Chat Interno'), findsOneWidget);
    expect(find.text('Organização de Partidas'), findsOneWidget);
    expect(find.text('Dashboard para Donos'), findsOneWidget);
    expect(find.text('Confiabilidade'), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });

  testWidgets('ContactFooter deve exibir copyright e colunas de links', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      buildTestableWidget(const SingleChildScrollView(child: ContactFooter())),
    );
    await tester.pumpAndSettle();

    expect(
      find.text('© 2026 SportBnb. Todos os direitos reservados.'),
      findsOneWidget,
    );
    expect(find.text('Termos de Uso'), findsOneWidget);
    expect(find.text('Produto'), findsOneWidget);
    expect(find.text('Empresa'), findsOneWidget);
    expect(find.text('Baixe o App'), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
