import 'package:flutter/material.dart';

import '../../../../core/cofig/routes/routers_name.dart';
import 'bottom_app_icon.dart';

class MyBottmAppBar extends StatelessWidget {
  const MyBottmAppBar({super.key, required this.currentPage});

  final String currentPage;

 

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.secondaryContainer,
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      child: Row(
        children: [
          Expanded(
            child: BottomAppIcon(currentPage: currentPage, navPage: RoutersName.home, icon: Icons.home,),
          ),
          Expanded(
            child: BottomAppIcon(currentPage: currentPage, navPage:  RoutersName.list, icon: Icons.dashboard),
          ),
          Spacer(),
          Expanded(
            child: BottomAppIcon(currentPage: currentPage, navPage:  RoutersName.calendar,icon: Icons.calendar_view_day_outlined),
          ),
          Expanded(
            child: BottomAppIcon(currentPage: currentPage, navPage: RoutersName.pay , icon: Icons.credit_card),
          ),
        ],
      ),
    );
  }
}