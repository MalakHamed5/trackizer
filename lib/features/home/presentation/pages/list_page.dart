import 'package:flutter/material.dart';
import 'package:trackizer/core/cofig/routes/routers_name.dart';

import '../../../../core/const/assets.dart';
import '../widgets/budget_card.dart';
import '../widgets/my_bottom_app_bar.dart';
import '../widgets/my_floationg_acion_button.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "Spending & Budgets",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.tertiaryContainer,
            ),
          ),
        ],
      ),

      floatingActionButton: MyFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottmAppBar(currentPage: RoutersName.list),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.tertiaryContainer.withOpacity(0.8),
                  ),
                ),
                child: Text(
                  'Your budgets are on track ',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              //---Budget Card
              BudgetCard(
                title: 'Auto & Transport',
                subTitle: "\$375 left to spend",
                img: Assets.assetsImgAutoTransport,
                spent: 25.5,
                total: 400,
                progressColor: Theme.of(context).colorScheme.tertiary,
                progress: 0.3,
              ),
              SizedBox(height: 10),
              //---Add Cat
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 80),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        'Add new category',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.add_circle_outline_sharp, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
