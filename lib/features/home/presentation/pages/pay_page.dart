import 'package:flutter/material.dart';
import 'package:trackizer/core/cofig/routes/routers_name.dart';

import '../widgets/my_bottom_app_bar.dart';
import '../widgets/my_floationg_acion_button.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottmAppBar(currentPage: RoutersName.pay),
      body: Center(child: Text("Payment Page")),
    );
  }
}
