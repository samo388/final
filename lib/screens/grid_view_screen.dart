import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GridViewOfProductsScreen extends StatefulWidget {
  const GridViewOfProductsScreen({super.key});

  @override
  State<GridViewOfProductsScreen> createState() =>
      _GridViewOfProductsScreenState();
}

class _GridViewOfProductsScreenState extends State<GridViewOfProductsScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2D2F41),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Lottie.asset(
                  'assets/cart.json',
                  height: 100,
                  width: double.infinity,
                ),

              ],
            ),
    );
  }
}
