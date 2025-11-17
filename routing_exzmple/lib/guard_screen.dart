import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class GuardScreen extends StatelessWidget {
  const GuardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Guard Screen")),
      body: const Center(
        child: Text("🎉 Akses Berhasil!"),
      ),
    );
  }
}
