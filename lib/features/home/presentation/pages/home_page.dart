import 'package:flutter/material.dart';
import 'package:trackizer/core/cofig/routes/routers_name.dart';
import 'package:trackizer/core/utils/device_utils.dart';
import 'package:trackizer/features/home/presentation/widgets/custom_arc_paint.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- Bottom Navigation Bar ---//
      floatingActionButton: MyFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottmAppBar(currentPage: RoutersName.home),
      // --- Body ---//
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---Upper part
            Stack(
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
                                size: Size(270, 190),
                                painter: CustomArcPaint(),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(height: 70),
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
                                    SizedBox(height: 5),
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
                        SizedBox(height: 80),
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
                        Spacer(),
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
            // --- Menu buttons
            Container(
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
                    child: HomeMenu(
                      title: "Upcoming bills",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            // --- Recent activities
            //ToDo: but it in listview builder
            SingleChildScrollView(
              child: Column(
                children: [
                  ListTileActive(
                    img: Assets.assetsImgSpotifyLogo,
                    title: 'Spotify',
                    price: '\$9.99',
                    onTap: () {},
                  ),
                  ListTileActive(
                    img: Assets.assetsImgYoutubeLogo,
                    title: 'YouTube Premium',
                    price: '\$5.09',
                    onTap: () {},
                  ),
                  ListTileActive(
                    img: Assets.assetsImgOnedriveLogo,
                    title: 'Microsoft OneDrive',
                    price: '\$16.99',
                    onTap: () {},
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



