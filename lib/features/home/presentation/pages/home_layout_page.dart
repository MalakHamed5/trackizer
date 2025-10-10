import 'package:flutter/material.dart';
import 'package:trackizer/features/financehub/presentation/pages/billing_schedule_page.dart';
import 'package:trackizer/features/financehub/presentation/pages/spending_budget_page.dart';
import 'package:trackizer/features/home/presentation/pages/home_page.dart';
import 'package:trackizer/features/home/presentation/widgets/my_bottom_app_bar.dart';
import 'package:trackizer/features/payment/presentation/pages/payment_page.dart';

import '../widgets/my_floationg_acion_button.dart';

class HomeLayoutPage extends StatefulWidget {
  const HomeLayoutPage({super.key});

  @override
  State<HomeLayoutPage> createState() => _HomeLayoutPageState();
}

class _HomeLayoutPageState extends State<HomeLayoutPage> {
  int _index = 0;
  final List<Widget> _pages = const [
    HomePage(
      key: PageStorageKey('home'),
    ),
    SpendingBugetPage(
      key: PageStorageKey('spending'),
    ),
    BillingSchedulePage(
      key: PageStorageKey('billing'),
    ),
    PaymentPage(
      key: PageStorageKey('payment'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MyFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
      bottomNavigationBar: MyBottmAppBar(
        currentIndex: _index,

        onTap: (index) {
          _index = index;
          setState(() {});
        },
      ),
    );
  }
}
