import 'package:expensetracker/features/homepage/presentation/state/financial_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expensetracker/config/router/app_routes.dart';
import 'package:expensetracker/features/homepage/presentation/view_model/home_view_model.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  // late final HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    // viewModel = ref.read(homeViewModelProvider);
  }

  @override
  Widget build(BuildContext context) {
    final financialState = ref.watch(financialStateProvider);
    final double incomePercentage = (financialState.income / (financialState.income + financialState.expenses)) * 100;
    final double expensePercentage = (financialState.expenses / (financialState.income + financialState.expenses)) * 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Expense Tracker', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.calenderRoute);
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFBDC5D0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildPieChart(incomePercentage, expensePercentage),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: _buildFinancialStats(),
              ),
              _buildGridView(context),
            ],
          ),
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text('Expense\nTracker', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            _drawerItem(Icons.calendar_today, 'Calendar', () {
              Navigator.pushNamed(context, AppRoutes.calenderRoute);
            }),
            _drawerItem(Icons.category, 'Add Category', () => Navigator.pop(context)),
            _drawerItem(Icons.payment, 'Payment Mode', () => Navigator.pop(context)),
            _drawerItem(Icons.insert_drive_file, 'Generated Reports', () => Navigator.pop(context)),
            _drawerItem(Icons.settings, 'Settings', () {
              Navigator.pushNamed(context, AppRoutes.settingsRoute);
            }),
            _drawerItem(Icons.lock, 'App Lock', () {}, trailing: Switch(
              value: true, onChanged: (bool value) {}, activeColor: Colors.white,
            )),
            const Divider(color: Colors.white),
            _drawerItem(Icons.star, 'Pro Version', () => Navigator.pop(context)),
            _drawerItem(Icons.share, 'Share with friends', () => Navigator.pop(context)),
            _drawerItem(Icons.privacy_tip, 'Privacy Policy', () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }

  ListTile _drawerItem(IconData icon, String title, VoidCallback onTap, {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: onTap,
      trailing: trailing,
    );
  }

  Widget _buildPieChart(double incomePercentage, double expensePercentage) {
    return Center(
      child: Container(
        width: 360,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 40,
                  sectionsSpace: 0,
                  startDegreeOffset: -90,
                  sections: [
                    PieChartSectionData(
                      color: Colors.green,
                      value: incomePercentage,
                      title: '${incomePercentage.toStringAsFixed(1)}%',
                      radius: 80,
                      titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    PieChartSectionData(
                      color: Colors.red,
                      value: expensePercentage,
                      title: '${expensePercentage.toStringAsFixed(1)}%',
                      radius: 80,
                      titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Indicator(color: Colors.green, text: 'Income', isSquare: true),
                SizedBox(width: 8),
                Indicator(color: Colors.red, text: 'Expense', isSquare: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinancialStats() {
    final financialState = ref.watch(financialStateProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text('Income', style: TextStyle(color: Colors.green, fontSize: 18)),
            Text('Rs. ${financialState.income}', style: TextStyle(color: Colors.green, fontSize: 18)),
          ],
        ),
        Column(
          children: [
            Text('Expenses', style: TextStyle(color: Colors.red, fontSize: 18)),
            Text('Rs. ${financialState.expenses}', style: TextStyle(color: Colors.red, fontSize: 18)),
          ],
        ),
        Column(
          children: [
            Text('Balance', style: TextStyle(color: Colors.blue, fontSize: 18)),
            Text('Rs. ${financialState.balance}', style: TextStyle(color: Colors.blue, fontSize: 18)),
          ],
        ),
      ],
    );
  }

  Widget _buildGridView(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildGridItem(Icons.add_circle_outline, Colors.brown, 'Add Income', () => Navigator.pushNamed(context, AppRoutes.add_incomeRoute)),
        _buildGridItem(Icons.remove_circle_outline, Colors.teal, 'Add Expenses', () => Navigator.pushNamed(context, AppRoutes.add_expenseRoute)),
        _buildGridItem(Icons.list, Colors.green, 'All Transactions', () => Navigator.pushNamed(context, AppRoutes.all_transactionRoute)),
        _buildGridItem(Icons.report, Colors.blue, 'Reports', () => Navigator.pushNamed(context, AppRoutes.reportRoute)),
      ],
    );
  }

  Widget _buildGridItem(IconData icon, Color color, String text, VoidCallback onTap) {
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
            Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
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
        const SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
      ],
    );
  }
}
