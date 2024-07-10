import 'package:expensetracker/config/router/app_routes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final double income = 10000;
  final double expenses = 2000;

  @override
  Widget build(BuildContext context) {
    final double balance = income - expenses;
    final double incomePercentage = (income / (income + expenses)) * 100;
    final double expensePercentage = (expenses / (income + expenses)) * 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Expense Tracker',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.calenderRoute);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black, // Set the background color of the drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black, // Set the background color of the header
                ),
                child: Text(
                  'Expense\nTracker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today, color: Colors.white),
                title: const Text('Calendar',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.calenderRoute);
                },
              ),
              ListTile(
                leading: const Icon(Icons.category, color: Colors.white),
                title: const Text('Add Category',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.payment, color: Colors.white),
                title: const Text('Payment Mode',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:
                    const Icon(Icons.insert_drive_file, color: Colors.white),
                title: const Text('Generated Reports',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text('Settings',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.settingsRoute);
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock, color: Colors.white),
                trailing: Switch(
                  value: true, // Replace with your own logic
                  onChanged: (value) {},
                  activeColor: Colors.white,
                ),
                title: const Text('App Lock',
                    style: TextStyle(color: Colors.white)),
              ),
              const Divider(color: Colors.white),
              ListTile(
                leading: const Icon(Icons.star, color: Colors.white),
                title: const Text('Pro Version',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.share, color: Colors.white),
                title: const Text('Share with friends',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip, color: Colors.white),
                title: const Text('Privacy Policy',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.description, color: Colors.white),
                title: const Text('Terms and Policy',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFBDC5D0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Center(
                child: Container(
                  width: 360,
                  height: 400, // Increased height to accommodate chart and indicators
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: Colors.green,
                                    value: incomePercentage,
                                    title:
                                        '${incomePercentage.toStringAsFixed(1)} %',
                                    radius: 80,
                                    titleStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  PieChartSectionData(
                                    color: Colors.red,
                                    value: expensePercentage,
                                    title:
                                        '${expensePercentage.toStringAsFixed(1)} %',
                                    radius: 80,
                                    titleStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                                centerSpaceRadius: 40,
                                sectionsSpace: 0,
                                startDegreeOffset: -90,
                              ),
                            ),
                            const Text(
                              'May 2024',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Indicator(
                            color: Colors.green,
                            text: 'Income',
                            isSquare: true,
                          ),
                          SizedBox(width: 8),
                          Indicator(
                            color: Colors.red,
                            text: 'Expense',
                            isSquare: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Income',
                            style: TextStyle(color: Colors.green, fontSize: 18)),
                        Text('Rs. 10000',
                            style: TextStyle(color: Colors.green, fontSize: 18)),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Expenses',
                            style: TextStyle(color: Colors.red, fontSize: 18)),
                        Text('Rs. 2000',
                            style: TextStyle(color: Colors.red, fontSize: 18)),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Balance',
                            style: TextStyle(color: Colors.blue, fontSize: 18)),
                        Text('Rs. 8000',
                            style: TextStyle(color: Colors.blue, fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildGridItem(
                    icon: Icons.add_circle_outline,
                    color: Colors.brown,
                    text: 'Add Income',
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.add_incomeRoute);
                    },
                  ),
                  _buildGridItem(
                    icon: Icons.remove_circle_outline,
                    color: Colors.teal,
                    text: 'Add Expenses',
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.add_expenseRoute);
                    },
                  ),
                  _buildGridItem(
                    icon: Icons.list,
                    color: Colors.green,
                    text: 'All Transactions',
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppRoutes.all_transactionRoute);
                    },
                  ),
                  _buildGridItem(
                    icon: Icons.report,
                    color: Colors.blue,
                    text: 'Reports',
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppRoutes.reportRoute);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem({
    required IconData icon,
    required Color color,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 50),
            const SizedBox(height: 10),
            Text(text,
                style: const TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}
