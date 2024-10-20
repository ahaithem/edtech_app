import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../widgets/swiper_widget.dart';

class LearnAnyTime extends StatelessWidget {
  const LearnAnyTime({super.key});

  @override
  Widget build(BuildContext context) {
    const List<SwiperWidget> allSwiperWidgets = [
      SwiperWidget(
          imageIndex: 2,
          title: 'Learn anytime and anywhere',
          subTitle:
              'Quarantine is the perfect time to spend your day learning something new, from anywhere!'),
      SwiperWidget(
          imageIndex: 3,
          title: 'Find a course for you',
          subTitle:
              'Quarantine is the perfect time to spend your day learning something new, from anywhere!'),
      SwiperWidget(
          imageIndex: 4,
          title: 'Improve your skills',
          subTitle:
              'Quarantine is the perfect time to spend your day learning something new, from anywhere!')
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Swiper(
              layout: SwiperLayout.CUSTOM,
              customLayoutOption:
                  CustomLayoutOption(startIndex: -1, stateCount: 3)
                    ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                    ..addTranslate([
                      Offset(-370.0, -40.0),
                      Offset(0.0, 0.0),
                      Offset(370.0, -40.0)
                    ]),
              itemWidth: screenWidth * 0.7,
              itemHeight: screenHeight * 0.6,
              itemBuilder: (context, index) {
                // Return the corresponding SwiperWidget for the current index
                return allSwiperWidgets[index];
              },
              itemCount: allSwiperWidgets.length, // Number of swipes
              pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(
                    bottom:
                        200.0), //Edit her on depend on the width of the screen
                builder: DotSwiperPaginationBuilder(
                  color: Colors.grey, // Inactive color (grey)
                  activeColor: Colors.blue, // Active color (blue)
                  size: 10.0, // Size of inactive dots
                  activeSize: 12.0, // Size of active dot
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
