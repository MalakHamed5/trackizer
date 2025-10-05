import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cofig/routes/app_router.dart';
import '../../../../core/const/app_colors.dart';

class MyBottmAppBar extends StatelessWidget {
  const MyBottmAppBar({super.key, required this.currentPage});

  final String currentPage;
  final double hpad = 16;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(hpad, 0, hpad, 16),
      decoration: const BoxDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: BottomAppBar(
          notchMargin: 8,
          color: Theme.of(context).colorScheme.secondaryContainer,
          shape: InsetCircularNotchedRectangle(inset: hpad),
          child: Row(
            children: [
              Expanded(
                child: BottomAppIcon(
                  currentPage: currentPage,
                  navPage: AppRouter.home,
                  icon: Icons.home,
                ),
              ),
              Expanded(
                child: BottomAppIcon(
                  currentPage: currentPage,
                  navPage: AppRouter.spendingBuget,
                  icon: Icons.dashboard,
                ),
              ),
              const Spacer(),
              Expanded(
                child: BottomAppIcon(
                  currentPage: currentPage,
                  navPage: AppRouter.calendar,
                  icon: Icons.calendar_view_day_outlined,
                ),
              ),
              Expanded(
                child: BottomAppIcon(
                  currentPage: currentPage,
                  navPage: AppRouter.pay,
                  icon: Icons.credit_card,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomAppIcon extends StatelessWidget {
  const BottomAppIcon({
    super.key,
    required this.currentPage,
    required this.navPage,
    required this.icon,
  });

  final String currentPage;
  final String navPage;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (currentPage != navPage) context.push(navPage);
      },
      icon: Icon(
        icon,
        color: currentPage == navPage ? Colors.white : AppColors.gray50,
      ),
    );
  }
}

class InsetCircularNotchedRectangle extends CircularNotchedRectangle {
  final double inset;
  const InsetCircularNotchedRectangle({this.inset = 0});

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    final shiftedGuest = guest?.shift(Offset(-inset, 0));
    return super.getOuterPath(host, shiftedGuest);
  }
}
