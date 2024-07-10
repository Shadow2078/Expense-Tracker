import 'package:expensetracker/features/add_expense/presentation/view/add_expense_view.dart';
import 'package:expensetracker/features/add_income/presentation/view/add_income_view.dart';
import 'package:expensetracker/features/all_transaction/presentation/view/all_transaction.dart';
import 'package:expensetracker/features/calender/presentation/view/calender.dart';
import 'package:expensetracker/features/homepage/presentation/view/home.dart';
import 'package:expensetracker/features/reports/presentation/view/report.dart';
import 'package:expensetracker/features/settings/presentation/view/settings.dart';

class AppRoutes {
  AppRoutes._(); // private constructor cannot use without its name

  // static const String homeRoute = "/homepage";

  // static const String splashRoute = "/splash";
  // static const String loginRoute = "/login";
  // static const String registerRoute = "/register";
  // static const String imgg = "/img";
  static String homepageRoute = "/home";
  static String add_incomeRoute = "/addincome";
  static String add_expenseRoute = "/addexpense";
  static String calenderRoute = "/calender";
  static String reportRoute = "/reports";
  static String settingsRoute = "/setting";
  static String all_transactionRoute = "/alltranaction";
  static String loginRoute = "/login";

  static getApplicationRoute() {
    return {
      // homeRoute: (context) => const HomeView(),
      homepageRoute: (context) => const HomeView(),
      add_incomeRoute: (context) => const AddIncomeView(),
      add_expenseRoute: (context) => const AddExpenseView(),
      all_transactionRoute: (context) => const AllTransactionView(),
      calenderRoute:(context) => const CalendarView(),
      reportRoute:(context) => const ReportView(),
      // exploreRoute: (context) => const ExplorePage(),
      // savedRoute: (context) => const SavedPage(),
      // bookingsRoute: (context) => const BookingsPage(),
      settingsRoute: (context) => const SettingsView(),
      // registerRoute: (context) =>  SignupPage(),
      // loginRoute: (context) => const LoginPage(),
      // splashRoute: (context) => SplashScreen(),
      // loginRoute: (context) => const MyLogin(),
      // registerRoute: (context) => MyRegister(),
      // imgg: (context) => const ImageView(),
    };
  }
}
