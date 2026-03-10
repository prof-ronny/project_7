import 'package:flutter/material.dart';

import 'primary_button.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.red),
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            side: WidgetStateProperty.all(
              BorderSide(color: Colors.red, width: 1.5),
            ),
          ),
        ),
      ),
      home: InitialScreen(),
    ),
  );
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
            PrimaryButton(
              label: 'Primary Button',
              icon: Icons.send,
              onPressed: () => update('Primary Button clicked'),
            ),
          ],
        ),
      ),
    );
  }
}
