import 'package:expensetracker/config/router/app_routes.dart';
import 'package:flutter/material.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ExpenseTracker_App',
      initialRoute: AppRoutes.homepageRoute,
      routes: AppRoutes.getApplicationRoute(),
    );
  }
}


