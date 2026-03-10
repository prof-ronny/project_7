import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: InitialScreen()));
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons - Initial Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(onPressed: () {}, child: const Text('FilledButton')),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
            const SizedBox(height: 12),
            TextButton(onPressed: () {}, child: const Text('TextButton')),
          ],
        ),
      ),
    );
  }
}
