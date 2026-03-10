import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: InitialScreen()));
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});
  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  String message = '';
  void update(String value) {
    setState(() => message = value);
  }

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
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.green;
                  }
                  return Colors.indigo;
                }),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => update('OutlinedButton clicked'),
              onLongPress: () => update('Long press!'),
              child: const Text('Outlined'),
            ),
            const SizedBox(height: 12),
            TextButton(onPressed: () {}, child: const Text('TextButton')),
            const SizedBox(height: 12),
            Text(message),
          ],
        ),
      ),
    );
  }
}
