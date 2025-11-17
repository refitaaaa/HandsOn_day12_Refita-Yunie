// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:routing_example/app_routes.dart';
import 'package:routing_example/guards.dart';
import 'package:routing_example/main.dart';

void main() {
  testWidgets('HomeScreen smoke test', (WidgetTester tester) async {
    final authGuard = AuthGuard();
    final appRouter = AppRouter(authGuard: authGuard);

    await tester.pumpWidget(MyApp(appRouter: appRouter));

    // Pastikan text muncul
    expect(find.text('Laptop Gaming'), findsOneWidget);
    expect(find.text('Smartphone Pro'), findsOneWidget);

    // Tap tombol Detail Produk
    await tester.tap(find.text('Go to Detail Screen'));
    await tester.pumpAndSettle();

    // Pastikan pindah ke DetailScreen
    expect(find.text('Product ID: 1\nProduct Name: Laptop Gaming'), findsOneWidget);
  });

  testWidgets('Navigation to SecondScreen test', (WidgetTester tester) async {
    final authGuard = AuthGuard();
    final appRouter = AppRouter(authGuard: authGuard);

    await tester.pumpWidget(MyApp(appRouter: appRouter));

    await tester.tap(find.text('Go to Second Screen'));
    await tester.pumpAndSettle();

    expect(find.text('Ini Halaman Kedua'), findsOneWidget);
  });

  testWidgets('Auth Guard test', (WidgetTester tester) async {
    final authGuard = AuthGuard();
    final appRouter = AppRouter(authGuard: authGuard);

    await tester.pumpWidget(MyApp(appRouter: appRouter));

    await tester.tap(find.text('Halaman dengan Guard (Butuh Login)'));
    await tester.pumpAndSettle();

    // Pastikan dialog login muncul
    expect(find.text('Login Diperlukan'), findsOneWidget);

    // Tap login button
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Pastikan masuk ke GuardScreen
    expect(find.text('🎉 Akses Berhasil!'), findsOneWidget);
  });
}
