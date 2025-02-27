import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cronometro(),
    );
  }
}

class Cronometro extends StatefulWidget {
  @override
  _CronometroState createState() => _CronometroState();
}

class _CronometroState extends State<Cronometro> {
  int segundos = 0;
  Timer? _timer;
  bool corriendo = false;

  void iniciar() {
    if (!corriendo) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          segundos++;
        });
      });
      setState(() {
        corriendo = true;
      });
    }
  }

  void detener() {
    _timer?.cancel();
    setState(() {
      corriendo = false;
    });
  }

  void reiniciar() {
    _timer?.cancel();
    setState(() {
      segundos = 0;
      corriendo = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cronómetro")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$segundos s",
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: iniciar,
                  child: const Text("Iniciar"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: detener,
                  child: const Text("Detener"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: reiniciar,
                  child: const Text("Reiniciar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
