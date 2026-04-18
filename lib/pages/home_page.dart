import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tab = 0;

  void _changeTab() => setState(() => _tab = _tab == 0 ? 1 : 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .start,
          children: [
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: _changeTab,
                    child: Text('Home', style: _getStyle(bold: _tab == 0)),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: _changeTab,
                    child: Text('Sobre', style: _getStyle(bold: _tab == 1)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _getStyle({bool bold = false}) {
    return TextStyle(
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      fontSize: 25,
    );
  }
}
