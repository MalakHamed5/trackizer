// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../core/cofig/routes/app_router.dart';
import '../widgets/my_bottom_app_bar.dart';
import '../widgets/my_floationg_acion_button.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(   floatingActionButton: const MyFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     
      bottomNavigationBar: const MyBottmAppBar(currentPage: AppRouter.pay),
      body:const Center(child:  Text("Payment Page")),
    );
  }
}
