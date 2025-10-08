// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trackizer/core/const/app_colors.dart';
import 'package:trackizer/core/shared/appbars/custom_appbar_text.dart';
import 'package:trackizer/features/home/presentation/widgets/cutom_arc_180_painter.dart';

import '../../../../core/cofig/routes/app_router.dart';
import '../../../../core/const/assets.dart';
import '../../../../core/utils/device_utils.dart';
import '../../data/models/budget_model.dart';
import '../widgets/add_button.dart';
import '../widgets/budget_card.dart';
import '../widgets/my_bottom_app_bar.dart';
import '../widgets/my_floationg_acion_button.dart';

class SpendingBugetPage extends StatefulWidget {
  const SpendingBugetPage({super.key});

  @override
  State<SpendingBugetPage> createState() => _SpendingBugetPageState();
}

class _SpendingBugetPageState extends State<SpendingBugetPage> {
  //---Data
  List<BudgetModel> bugetArr = [
    BudgetModel(
      title: "Auto & Transport",
      img: Assets.assetsImgAutoTransport,
      spent: 304,
      total: 400,
      color: AppColors.secondaryG,
    ),
    BudgetModel(
      title: "Entertainment",
      img: Assets.assetsImgEntertainment,
      spent: 50.99,
      total: 600,
      color: AppColors.secondary,
    ),
    BudgetModel(
      title: "Security",
      img: Assets.assetsImgSecurity,
      spent: 5.99,
      total: 600,
      color: AppColors.primary10,
    ),
    BudgetModel(
      title: "Auto & Transport",
      img: Assets.assetsImgAutoTransport,
      spent: 304,
      total: 400,
      color: AppColors.secondaryG,
    ),
    BudgetModel(
      title: "Entertainment",
      img: Assets.assetsImgEntertainment,
      spent: 50.99,
      total: 600,
      color: AppColors.secondary,
    ),
    BudgetModel(
      title: "Security",
      img: Assets.assetsImgSecurity,
      spent: 5.99,
      total: 600,
      color: AppColors.primary10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MyFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.backgroundDark,
      bottomNavigationBar: const MyBottmAppBar(
        currentPage: AppRouter.spendingBuget,
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomTextAppBar(title: "Spending & Budgets"),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // -- AppBar
            //--- Tracker
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: DeviceUtils.getScreenHeight(context) * 0.15,
                      width: DeviceUtils.getScreenWidth(context) * 0.5,
                      child: CustomPaint(
                        painter: CustomArc180Paint(
                          drawArc: [
                            ArcValueModel(
                              color: AppColors.secondaryG,
                              value: 20,
                            ),
                            ArcValueModel(
                              color: AppColors.secondary,
                              value: 45,
                            ),
                            ArcValueModel(
                              color: AppColors.primary10,
                              value: 70,
                            ),
                          ],
                          end: 50,
                          width: 12,
                          bgWidth: 8,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 80),
                            Text(
                              "\$8.099",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize:
                                    DeviceUtils.getScreenWidth(context) * 0.08,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "of \$4000 budget",
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onTertiary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //--- Your budgets are on track
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 16,
                  left: 16,
                  right: 16,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 70,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.tertiaryContainer.withOpacity(0.8),
                  ),
                ),
                child: Text(
                  'Your budgets are on track 👍',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            //---Budget Card
            SliverList(
              delegate: SliverChildBuilderDelegate((context, i) {
                final budget = bugetArr[i];
                return BudgetCard(
                  onTap: () {},
                  title: budget.title,
                  img: budget.img,
                  remaining: budget.remaining,
                  total: budget.total,
                  progressColor: budget.color,
                  progress: budget.progress,
                );
              }, childCount: bugetArr.length),
            ),
            //--- Add new cat
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: AddButton(title : 'Add new category'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

