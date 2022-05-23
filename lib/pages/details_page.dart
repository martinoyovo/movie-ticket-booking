import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:movie_ticket_booking/data/movie_details.dart';
import 'package:movie_ticket_booking/pages/booking_page.dart';
import 'package:movie_ticket_booking/utils/styles.dart';
import 'package:movie_ticket_booking/widgets/svg_icon.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      bottomSheet: Container(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 25),
        color: Styles.backgroundColor,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SvgIcon(assetName: 'ticket'),
              Gap(10),
              Text(
                'Beli Ticket',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: Styles.buttonColor,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BookingPage(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerLeft,
              children: [
                Image.asset(
                  Styles.imagePath('banner.png'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 220,
                  color: Colors.grey.withOpacity(0.35),
                  colorBlendMode: BlendMode.modulate,
                ),
                Positioned.fill(
                  child: Image.asset(
                    Styles.imagePath('play.png'),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child:
                              Image.asset(Styles.imagePath('star_wars.png'))),
                      Container(
                        padding: const EdgeInsets.only(top: 30, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Star Wars :\nThe Last Jedi',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: movieDetails.map<Widget>((d) {
                                return Container(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 65,
                                        child: Text(
                                          d['key'],
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.35),
                                              fontSize: 12),
                                        ),
                                      ),
                                      const Gap(20),
                                      Text(
                                        d['value'],
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Gap(210),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 25,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: List<Icon>.generate(5, (index) {
                                return Icon(
                                  index == 4
                                      ? CupertinoIcons.star_lefthalf_fill
                                      : CupertinoIcons.star_fill,
                                  color: const Color(0xFFFAC921),
                                  size: 12,
                                );
                              }),
                            ),
                            const Spacer(),
                            const Text(
                              '8.9/10',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 25,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Duration',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.35),
                                fontSize: 12,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              '152 Min',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 30),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 0.8),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Text('P-G',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.35),
                                    fontSize: 12)),
                            const Spacer(),
                            const Text(
                              '13+',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  const Center(
                    child: Text(
                      'Synopsis',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  const Gap(20),
                  Text(
                    '''Dalam film Lucasfilm Star Wars: The Last Jedi, kisah keluarga Skywalker diteruskan ketika para pahlawan The Force Awakens bergabung dengan para legenda galaksi dalam sebuah petualangan mencengangkan untuk menguak kunci misteri lintas zaman mengenai the Force serta terkuaknya secara mengejutkan berbagai rahasia masa lalu.

Film ini dibintangi Mark Hamill, Carrie Fisher, Adam Driver, Daisy Ridley, John Boyega, Oscar Isaac, Lupita Nyong’o, Andy Serkis, Domhnall Gleeson, Anthony Daniels, Gwendoline Christie, Kelly Marie Tran, Laura Dern dan Benicio Del Toro.

Star Wars: The Last Jedi ditulis & disutradarai oleh Rian Johnson dan diproduseri Kathleen Kennedy serta Ram Bergman. J.J. Abrams, Tom Karnowski dan Jason McGatlin sebagai produser eksekutif.''',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.4),
                        letterSpacing: 1,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
