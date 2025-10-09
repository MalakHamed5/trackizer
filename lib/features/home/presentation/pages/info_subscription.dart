// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackizer/core/shared/buttons/secondary_btn.dart';
import 'package:trackizer/core/utils/tools.dart';
import 'package:trackizer/features/home/data/models/subseription_model.dart';

import '../../../../core/const/app_sizes.dart';

class InfoSubscription extends StatelessWidget {
  const InfoSubscription({super.key, this.scprition});

  final SubscriptionModel? scprition;

  @override
  Widget build(BuildContext context) {
    final args = GoRouterState.of(context).extra as SubscriptionModel;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: appColor.secondaryContainer,
                borderRadius: AppSizes.brL,
              ),
              child: Column(
                children: [
                  // --- Part
                  Container(
                    height: appH * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: AppSizes.brL,
                      color: appColor.primaryContainer.withOpacity(0.5),
                    ),
                    child: Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.pop();
                                },
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 40,
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                "Subscription info",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete_rounded,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: appH * 0.2,
                            width: appW * 0.3,
                            child: Image.asset(args.img),
                          ),
                          Text(
                            args.title,
                            style: TextStyle(
                              color: appColor.onPrimary,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            args.price,
                            style: TextStyle(
                              color: appColor.onPrimary.withOpacity(0.5),
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // --- Info
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 25,
                    ),
                    height: appH * 0.35,
                    decoration: BoxDecoration(
                      color: appColor.primaryContainer.withOpacity(0.2),
                      borderRadius: AppSizes.brL,
                      border: BoxBorder.all(
                        color: appColor.onPrimary.withOpacity(0.3),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          _InfoList(
                            args: args,
                            infoName: 'Name',
                            onTap: () {},
                            title: args.title,
                          ),
                          _InfoList(
                            args: args,
                            infoName: 'Descrpition',
                            onTap: () {},
                            title: "Music app",
                          ),
                          _InfoList(
                            args: args,
                            infoName: 'First payment',
                            onTap: () {},
                            title: "08.01.2022",
                          ),
                          _InfoList(
                            args: args,
                            infoName: 'Reminder',
                            onTap: () {},
                            title: "Never",
                          ),
                        ],
                      ),
                    ),
                  ),
                  // --- Save btn
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    child: SecondaryButton(onPressed: () {}, txt: "Save"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoList extends StatelessWidget {
  const _InfoList({
    super.key,
    required this.args,
    required this.infoName,
    required this.onTap,
    required this.title,
  });

  final SubscriptionModel args;
  final String infoName;
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 28),
      child: Row(
        children: [
          Text(
            infoName,
            style: TextStyle(color: appColor.onPrimary, fontSize: 16),
          ),
          const Spacer(),

          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Text(title),
                Icon(Icons.arrow_forward_ios_rounded, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
