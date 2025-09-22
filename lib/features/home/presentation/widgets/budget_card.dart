

import 'package:flutter/material.dart';

import '../../../../core/const/app_colors.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.img,
    required this.spent,
    required this.total,
    required this.progressColor, required this.progress,
  });

  final String title;
  final String subTitle;
  final String img;
  final double spent;
  final double total;
  final Color progressColor;
  final double progress; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.secondaryContainer.withOpacity(0.7),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    img,
                    height: 40,
                    width: 40,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          subTitle,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        "\$${spent.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "\$${total.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 18),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8),
                child: LinearProgressIndicator(
                  value: progress,
                  color: progressColor,
                  backgroundColor: AppColors.gray70,
                  minHeight: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
