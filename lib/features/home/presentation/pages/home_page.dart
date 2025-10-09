// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackizer/core/shared/appbars/custom_appbar_text.dart';
import 'package:trackizer/core/utils/device_utils.dart';
import 'package:trackizer/features/home/data/models/subseription_model.dart';
import 'package:trackizer/features/home/presentation/widgets/custom_arc_paint.dart';

import '../../../../core/config/routes/app_router.dart';
import '../../../../core/const/app_sizes.dart';
import '../../../../core/const/assets.dart';
import '../../../../core/utils/tools.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomTextAppBar(
          title: '',
          backgroundColor: appColor.secondaryContainer.withOpacity(0.5),
          showLeadingIcon: false,
        ),
      ),
      bottomNavigationBar: const MyBottmAppBar(currentPage: AppRouter.home),
      // --- Body ---//
      body: CustomScrollView(
        slivers: [
          // ---- Chart
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: appH * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: appColor.secondaryContainer.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
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
                        sizeH(80),
                        //See your budget button
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(11.0),
                            decoration: BoxDecoration(
                              color: appColor.primaryContainer,
                              borderRadius: AppSizes.brL,
                              border: Border.all(
                                color: appColor.secondaryContainer,
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              "see your budget",
                              style: TextStyle(
                                fontSize: 18,
                                color: appColor.onPrimary,
                              ),
                            ),
                          ),
                        ),
                        sizeH(20),
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
                                  color: appColor.primary,
                                  title: 'Active subs',
                                  count: '12',
                                  onTap: () {},
                                ),
                              ),
                              Expanded(
                                child: StatusCard(
                                  color: appColor.secondary,
                                  title: 'Highest subs',
                                  count: '\$19.99',
                                  onTap: () {},
                                ),
                              ),
                              Expanded(
                                child: StatusCard(
                                  color: appColor.tertiary,
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
                horizontal: appW * 0.04,
                vertical: appW * 0.04,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: AppSizes.brL,
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
                onTap: () {
                  context.push(AppRouter.infoSub, extra: script);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
