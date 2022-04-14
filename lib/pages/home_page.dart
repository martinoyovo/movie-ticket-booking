import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_ticket_booking/data/movie_data.dart';
import 'package:movie_ticket_booking/pages/details_page.dart';
import 'package:movie_ticket_booking/pages/saved_booking.dart';
import 'package:movie_ticket_booking/utils/layouts.dart';
import 'package:movie_ticket_booking/utils/styles.dart';
import 'package:movie_ticket_booking/widgets/dotted_container.dart';
import 'package:movie_ticket_booking/widgets/svg_icon.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);

    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.scale(
              scale: 0.7,
              child: CircleAvatar(
                backgroundImage: AssetImage(Styles.imagePath('avatar.png',)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SvgIcon(assetName: 'carbon_location'),
                Gap(5),
                Text('Tanterang Selatan', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),)
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => const SavedBooking()
                ));
              },
              child: const DottedContainer(
                child: SvgIcon(assetName: 'notifications'),
              ),
            )
          ],
        )
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15),
        physics: const BouncingScrollPhysics(),
        children: [
          CarouselSlider.builder(
            carouselController: _controller,
            options: CarouselOptions(
              aspectRatio: 2.25,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
            ),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Styles.gradient1Color,
                          Styles.gradient2Color,
                        ]
                      )
                    ),
                    child: _current == index ? SafeArea(
                      minimum: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(10),
                          const Text('Nonton Dimana Saja,\nKapan Saja', style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),),
                          const Gap(10),
                          const Text('Mulai', style: TextStyle(color: Colors.white, fontSize: 10),),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Rp.20,000',
                                  style: GoogleFonts.openSans(color: Styles.yellowColor, fontWeight: FontWeight.bold, fontSize: 20)
                                ),
                                TextSpan(
                                  text: ' / 30 Hari',
                                  style: GoogleFonts.openSans(color: Styles.yellowColor)
                                ),
                              ]
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                            decoration: BoxDecoration(
                              color: Styles.yellowColor,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text('Klik Disni', style: TextStyle(color: Styles.backgroundColor, fontWeight: FontWeight.w500, fontSize: 13),),
                          ),
                          const Gap(5)
                        ],
                      ),
                    ) : const SizedBox(),
                  ),
                  _current == index ? Positioned(
                    right: 2,
                    bottom: 0,
                    child: Image.asset(Styles.imagePath('saly.png'), fit: BoxFit.cover,),
                  ) : const SizedBox()
                ],
              );
            },
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(5, (int index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 8,
                width: (index == _current) ? 30 : 12,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: (index == _current) ? const Color(0xFF4E3E8A) : const Color(0xFF2A2640)
                ),
              );
            }),
          ),
          const Gap(12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Sedang Tayang', style: TextStyle(fontSize: 22, color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.bold),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Lihat Semua', style: TextStyle(fontSize: 11, letterSpacing: 1, color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.bold),),
                    Icon(CupertinoIcons.chevron_forward, color: Colors.white.withOpacity(0.6), size: 15,)
                  ],
                )
              ],
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Row(
              children: movieData.map<Widget>((movie) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_) => const DetailsPage()
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Image.asset(movie['image'])
                        ),
                        const Gap(12),
                        Text(movie['title'], style: const TextStyle(color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.bold, fontSize: 13),),
                        const Gap(8),
                        Row(
                          children: List<Icon>.generate(5, (index) {
                            return Icon(index == 4 ? CupertinoIcons.star_lefthalf_fill : CupertinoIcons.star_fill, color: const Color(0xFFFAC921), size: 14,);
                          }),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const Gap(10),
          Divider(color: Colors.white.withOpacity(0.6),),
          Container(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: const Text('Voucher Deals', style: TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.bold),),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 15),
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  width: size.width*0.55,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Styles.gradient1Color,
                            Styles.gradient2Color,
                          ]
                      )
                  ),
                  child: Row(
                    children: [
                      Image.asset(Styles.imagePath('credit_card.png')),
                      const Gap(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(12),
                          const Text('Bayar Pakai\nDebit BCA', style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                          const Gap(2),
                          Row(
                              children: [
                                Text(
                                    'Hemat',
                                    style: GoogleFonts.openSans(color: Styles.yellowColor, fontSize: 10, fontWeight: FontWeight.bold)
                                ),
                                Text(
                                    ' 30%',
                                    style: GoogleFonts.openSans(color: Styles.yellowColor, fontWeight: FontWeight.bold, fontSize: 20)
                                ),
                              ]
                          ),
                          const Gap(10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                                color: Styles.yellowColor,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text('Klik Disni', style: TextStyle(color: Styles.backgroundColor, fontWeight: FontWeight.w500, fontSize: 10),),
                          ),
                          const Gap(22)
                        ],
                      ),
                    ],
                  )
                ),
                Container(
                  //height: 170,
                  width: size.width*0.55,
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Styles.gradient1Color,
                            Styles.gradient2Color,
                          ]
                      )
                  ),
                  child: Row(
                    children: [
                      Image.asset(Styles.imagePath('saly2.png')),
                      const Gap(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(12),
                          const Text('Bayar Pakai\nDebit BCA', style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                          const Gap(2),
                          Row(
                              children: [
                                Text(
                                    'Hemat',
                                    style: GoogleFonts.openSans(color: Styles.yellowColor, fontSize: 10, fontWeight: FontWeight.bold)
                                ),
                                Text(
                                    ' 30%',
                                    style: GoogleFonts.openSans(color: Styles.yellowColor, fontWeight: FontWeight.bold, fontSize: 20)
                                ),
                              ]
                          ),
                          const Gap(10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                                color: Styles.yellowColor,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text('Klik Disni', style: TextStyle(color: Styles.backgroundColor, fontWeight: FontWeight.w500, fontSize: 10),),
                          ),
                          const Gap(22)
                        ],
                      ),
                    ],
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
