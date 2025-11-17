import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:routing_example/app_routes.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Laptop Gaming'),
            const Text('Smartphone Pro'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.pushRoute(const SecondRoute()),
              child: const Text("Go to Second Screen"),
            ),
            ElevatedButton(
              onPressed: () => context.pushRoute(const GuardRoute()),
              child: const Text("Go to Guard Screen"),
            ),
            ElevatedButton(
              onPressed: () => context.pushRoute(
                  DetailRoute(productId: 1, productName: 'Laptop Gaming')),
              child: const Text("Go to Detail Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
