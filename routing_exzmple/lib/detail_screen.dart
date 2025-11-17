import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  final int productId;
  final String productName;

  const DetailScreen({
    super.key,
    @PathParam('id') required this.productId,
    @QueryParam('name') required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Screen")),
      body: Center(
        child: Text('Product ID: $productId\nProduct Name: $productName'),
      ),
    );
  }
}
