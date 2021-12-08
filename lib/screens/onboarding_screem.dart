import 'package:flutter/material.dart';
import 'package:shop/network/cache_helper.dart';
import 'package:shop/screens/login_screen.dart';
import 'package:shop/themes/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class obBoardingScreen extends StatefulWidget {
  const obBoardingScreen({Key? key}) : super(key: key);

  @override
  _obBoardingScreenState createState() => _obBoardingScreenState();
}

class _obBoardingScreenState extends State<obBoardingScreen> {
  PageController pagecontroler = PageController();
  bool isLast = false;
  List<boardingModel> model = [
    boardingModel('assets/onboard.jpg', 'title1', 'body1'),
    boardingModel('assets/onboard.jpg', 'title2', 'body2'),
    boardingModel('assets/onboard.jpg', 'title3', 'body3'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                CacheHelper.setData(key: 'onBoard', data: true).then((value) {
                  if (value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
                  {}
                });
              },
              child: Text('skip')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemCount: model.length,
                  controller: pagecontroler,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return onboarditem(
                      model[index],
                    );
                  },
                  onPageChanged: (int value) {
                    if (value == model.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pagecontroler, // PageController
                  count: model.length,

                  effect: const ExpandingDotsEffect(
                    expansionFactor: 2,
                    activeDotColor: defaultColor,
                  ),
                  // your preferred effect
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      CacheHelper.setData(key: 'onBoard', data: true)
                          .then((value) {
                        if (value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        }
                        {}
                      });
                    } else {
                      pagecontroler.nextPage(
                          duration: Duration(microseconds: 700),
                          curve: Curves.bounceIn);
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget onboarditem(boardingModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image.asset(
          '${model.image}',
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Text('${model.title}'),
      SizedBox(
        height: 15,
      ),
      Text('${model.body}'),
    ],
  );
}

class boardingModel {
  final String image;
  final String title;
  final String body;

  boardingModel(this.image, this.title, this.body);
}
