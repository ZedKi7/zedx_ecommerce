import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            ZPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  ZHomeAppBar(),

                  /// SearchBar

                  /// Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
