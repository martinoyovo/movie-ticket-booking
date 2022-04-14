import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_ticket_booking/data/movie_data.dart';
import 'package:movie_ticket_booking/pages/booking_page.dart';
import 'package:movie_ticket_booking/utils/styles.dart';
import 'package:movie_ticket_booking/widgets/svg_icon.dart';

class SavedBooking extends StatelessWidget {
  const SavedBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.appBarColor,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text('Daftar Film', style: TextStyle(fontWeight: FontWeight.w700),),
      ),
      body: Column(
        children: [
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0XFF2B2835),
                  borderRadius: BorderRadius.circular(7)
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6
                      ),
                      decoration: BoxDecoration(
                          color: Styles.buttonColor,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: const Text('Sedang Tayang', style: TextStyle(color: Colors.white, fontSize: 12),),
                    ),
                    const Gap(5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6
                      ),
                      child: Text('Akan Datang', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: movieData.map<Widget>((movie) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: SizedBox(
                      height: 180,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Image.asset(movie['image'])
                          ),
                          const Gap(12),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(movieData.indexOf(movie) == 0 ? movie['title']+' Jedi' :  movie['title'] , style: const TextStyle(color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.bold, fontSize: 20),),
                                const Gap(8),
                                Row(
                                  children: List<Icon>.generate(5, (index) {
                                    return Icon(index == 4 ? CupertinoIcons.star_lefthalf_fill : CupertinoIcons.star_fill, color: const Color(0xFFFAC921), size: 18,);
                                  }),
                                ),
                                const Gap(15),
                                Row(
                                  children: [
                                    Text('P-G', style: TextStyle(color: Colors.white.withOpacity(0.35), fontSize: 12),),
                                    const Gap(4),
                                    Text('13+', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                const Gap(5),
                                Text('Action, Sci-fi', style: TextStyle(color: Colors.white.withOpacity(0.35), fontSize: 12, fontWeight: FontWeight.bold),),
                                const Spacer(),
                                ElevatedButton(
                                  child: const Text('Beli Ticket', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
                                  style: ElevatedButton.styleFrom(
                                      primary: Styles.buttonColor,
                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7)
                                      )
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (_) => const BookingPage()
                                    ));
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

          ),
        ],
      ),
    );
  }
}
