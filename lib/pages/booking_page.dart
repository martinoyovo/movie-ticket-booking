import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_ticket_booking/utils/styles.dart';
import 'package:movie_ticket_booking/widgets/svg_icon.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.appBarColor,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text(
          'Star Wars: The Last Jedi',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime(2019, 1, 15),
            lastDate: DateTime(2022, 11, 20),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: Colors.white.withOpacity(0.6),
            dayColor: Colors.white.withOpacity(0.6),
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.transparent,
            dotsColor: Colors.white.withOpacity(0.6),
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en_ISO',
          ),
          Divider(color: Colors.white.withOpacity(0.6)),
          const Gap(10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Styles.appBarColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SvgIcon(assetName: 'search'),
                const Gap(10),
                Text(
                  'Cari Bioskop',
                  style: TextStyle(color: Colors.white.withOpacity(0.3)),
                )
              ],
            ),
          ),
          const Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(3, (index) {
              return Container(
                padding: const EdgeInsets.only(bottom: 15),
                child: ExpansionTile(
                  leading: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: index == 2
                          ? const SizedBox()
                          : Image.asset(Styles.imagePath('cgv.png'))),
                  title: Text(
                    index == 2 ? 'XXI Pamulang Barat' : 'CGV Pamulang Barat',
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  collapsedIconColor: Colors.white,
                  iconColor: Styles.highlightColor,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white.withOpacity(0.2), width: 0.8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Regular',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8)),
                              ),
                              Text(
                                'Rp. 50.000',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8)),
                              ),
                            ],
                          ),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(4, (index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(
                                    index == 0
                                        ? 0xFF25222D
                                        : index == 1
                                            ? 0xFF6255A7
                                            : 0xFF474659,
                                  ),
                                ),
                                child: Text(
                                  '16:00',
                                  style: TextStyle(
                                    color: index == 0
                                        ? Colors.white.withOpacity(0.4)
                                        : Colors.white,
                                  ),
                                ),
                              );
                            }),
                          ),
                          const Gap(30)
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
