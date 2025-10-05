// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../../core/const/app_colors.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({
    super.key,
    required this.title,
    required this.img,
    required this.remaining,
    required this.total,
    required this.progressColor,
    required this.progress,
    required this.onTap,
  });

  final String title;

  final String img;
  final double remaining;
  final double total;
  final Color progressColor;
  final double progress;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.secondaryContainer.withOpacity(0.5),
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
                  const SizedBox(width: 18),
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
                          "\$" + remaining.toString() + " left to spend",
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        "\$${remaining}",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "\$${total}",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
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
