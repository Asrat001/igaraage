import 'package:flutter/material.dart';

import '../../../common/widgets/my_app_bar.dart';

class PerformanceAnalyticsPage extends StatelessWidget {
  static String routeName = '/ar-identify';

  const PerformanceAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        leading: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text('Performance Analytics Page is under construction.'),
      ),
    );
  }
}