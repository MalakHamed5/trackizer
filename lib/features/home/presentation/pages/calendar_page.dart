// ignore_for_file: deprecated_member_use

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:trackizer/features/home/presentation/widgets/appbar_text.dart';
import 'dart:math';

import '../../../../core/cofig/routes/app_router.dart';
import '../../../../core/const/app_colors.dart';
import '../../../../core/const/assets.dart';
import '../../../../core/utils/device_utils.dart';
import '../../data/models/subseription_model.dart';
import '../widgets/my_bottom_app_bar.dart';
import '../widgets/my_floationg_acion_button.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarAgendaController calendarAgendaControllerNotAppBar =
      CalendarAgendaController();
  CalendarAgendaController calendarAgendaControllerAppBar =
      CalendarAgendaController();

  late DateTime selectedDateNotAppBBar;
  late DateTime selectedDateAppBBar;
  Random random = new Random();

  //--- Data
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
  void initState() {
    super.initState();
    selectedDateAppBBar = DateTime.now();
    selectedDateNotAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MyFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // --- Bottom Nav Bar ---//
      extendBody: true,
      bottomNavigationBar: const MyBottmAppBar(currentPage: AppRouter.calendar),
      // --- Body ---//
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            //---AppBar
            AppBarText(
              text: "Calender",
              backgroundColor: Theme.of(
                context,
              ).colorScheme.secondaryContainer.withOpacity(0.5),
            ),
            //---Header part
            SliverToBoxAdapter(
              child: Container(
                height: DeviceUtils.getScreenHeight(context) * 0.35,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.secondaryContainer.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16,
                  ),
                  child: Column(  
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Subs\nSchedule",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      //---Month button
                      Row(
                        children: [
                          const Text('3 subscriptions for today'),
                          const Spacer(),
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer
                                    .withOpacity(0.25),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.1),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  calendarAgendaControllerNotAppBar
                                      .openCalender();
                                },
                                child: const Row(
                                  children: [
                                    Text(
                                      'January',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //--- Calendar
                      CalendarAgenda(
                        calendarEventColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        controller: calendarAgendaControllerNotAppBar,
                        backgroundColor: Colors.transparent,
                        fullCalenderBackground: AppColors.backgroundDark,
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.tertiaryContainer.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                        selectedDateColor: Colors.white,
                        eventLogo: Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        locale: 'en',
                        weekDay: WeekDay.short,
                        fullCalendarDay: WeekDay.short,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(
                          const Duration(days: 140),
                        ),
                        lastDate: DateTime.now().add(const Duration(days: 15)),
                        events: List.generate(
                          100,
                          (index) => DateTime.now().subtract(
                            Duration(days: index * random.nextInt(5)),
                          ),
                        ),
                        onDateSelected: (date) {
                          setState(() {
                            selectedDateNotAppBBar = date;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            //--- First Txt
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "January",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "\$24.98",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //--- Second Txt
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "01.08.2022",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                    Text(
                      "in upcoming bills",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            //--- Grid
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, i) {
                final script = scription[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondaryContainer.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(12),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(script.img, height: 60, width: 60),
                        const Spacer(),
                        Text(
                          script.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          script.price,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }, childCount: scription.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 1,
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.amber, Colors.red]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
