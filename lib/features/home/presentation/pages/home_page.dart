// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:trackizer/core/utils/device_utils.dart';
import 'package:trackizer/features/home/data/models/subseription_model.dart';
import 'package:trackizer/features/home/presentation/widgets/custom_arc_paint.dart';

import '../../../../core/cofig/routes/app_router.dart';
import '../../../../core/const/assets.dart';
import '../widgets/home_menu.dart';
import '../widgets/list_tile_active.dart';

import '../widgets/my_bottom_app_bar.dart';
import '../widgets/my_floationg_acion_button.dart';
import '../widgets/status_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Data
  List<SubscriptionModel> scription = [
    SubscriptionModel(
      img: Assets.assetsImgSpotifyLogo,
      title: 'Spotify',
      price: '\$9.99',
    ),
    SubscriptionModel(
      img: Assets.assetsImgYoutubeLogo,
      title: 'YouTube Premium',
      price: '\$5.09',
    ),
    SubscriptionModel(
      img: Assets.assetsImgOnedriveLogo,
      title: 'Microsoft OneDrive',
      price: '\$16.99',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MyFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // --- Bottom Nav Bar ---//
      bottomNavigationBar: const MyBottmAppBar(currentPage: AppRouter.home),
      // --- Body ---//
      body: CustomScrollView(
        slivers: [
          // ---- Chart
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: DeviceUtils.getScreenHeight(context) * 0.55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondaryContainer.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 270,
                              height: 190,
                              child: CustomPaint(
                                size: const Size(270, 190),
                                painter: const CustomArcPaint(end: 220),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(height: 70),
                                    Image.asset(
                                      Assets.assetsImgAppLogo,
                                      fit: BoxFit.contain,
                                      height: 60,
                                      width: 100,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "\$1,250.00",
                                        style: TextStyle(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                          fontSize:
                                              DeviceUtils.getScreenWidth(
                                                context,
                                              ) *
                                              0.08,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "This month bills",
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onTertiary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 80),
                        //See your budget button
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(11.0),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Theme.of(
                                  context,
                                ).colorScheme.secondaryContainer,
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              "see your budget",
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        //Status buttons
                        Container(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 16,
                          ),

                          child: Row(
                            children: [
                              Expanded(
                                child: StatusCard(
                                  color: Theme.of(context).colorScheme.primary,
                                  title: 'Active subs',
                                  count: '12',
                                  onTap: () {},
                                ),
                              ),
                              Expanded(
                                child: StatusCard(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                  title: 'Highest subs',
                                  count: '\$19.99',
                                  onTap: () {},
                                ),
                              ),
                              Expanded(
                                child: StatusCard(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  title: 'Lowest subs',
                                  count: '\$4.99',
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // --- Menu buttons
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: DeviceUtils.getScreenWidth(context) * 0.04,
                vertical: DeviceUtils.getScreenWidth(context) * 0.04,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: HomeMenu(
                      title: "Your subscription",
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: HomeMenu(title: "Upcoming bills", onPressed: () {}),
                  ),
                ],
              ),
            ),
          ),
          // --- Recent activities
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: scription.length, (
              context,
              i,
            ) {
              final script = scription[i];
              return ListTileActive(
                img: script.img,
                title: script.title,
                price: script.price,
                onTap: () {},
              );
            }),
          ),
        ],
      ),
    );
  }
}
